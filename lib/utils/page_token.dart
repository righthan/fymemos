import 'dart:convert';

class PageToken {
  final int limit;
  final int offset;
  const PageToken({required this.limit, required this.offset});
}

class PageTokenCrypto {
  static const int LIMIT_FIELD_TAG = 1;
  static const int OFFSET_FIELD_TAG = 2;
  static const int WIRE_TYPE_VARINT = 0;

  static String createPageToken(int limit, int offset) {
    return encodePageToken(PageToken(limit: limit, offset: offset));
  }

  static String encodePageToken(PageToken pageToken) {
    final output = <int>[];
    _writeField(output, LIMIT_FIELD_TAG, pageToken.limit);
    _writeField(output, OFFSET_FIELD_TAG, pageToken.offset);
    return base64UrlEncode(output);
  }

  static PageToken decodePageToken(String encodedToken) {
    try {
      final bytes = base64Url.decode(encodedToken);
      int limit = 0;
      int offset = 0;
      int i = 0;
      while (i < bytes.length) {
        final tag = _readVarint(bytes, i);
        i = tag[1];
        final fieldNumber = tag[0] >> 3;
        final wireType = tag[0] & 0x7;
        if (fieldNumber == LIMIT_FIELD_TAG && wireType == WIRE_TYPE_VARINT) {
          final v = _readVarint(bytes, i);
          limit = v[0];
          i = v[1];
        } else if (fieldNumber == OFFSET_FIELD_TAG && wireType == WIRE_TYPE_VARINT) {
          final v = _readVarint(bytes, i);
          offset = v[0];
          i = v[1];
        } else {
          // 跳过未知字段
          i = _skipField(bytes, i, wireType);
        }
      }
      return PageToken(limit: limit, offset: offset);
    } catch (e) {
      throw Exception('Failed to decode page token: $e');
    }
  }

  static void _writeField(List<int> output, int fieldNumber, int value) {
    final tag = (fieldNumber << 3) | WIRE_TYPE_VARINT;
    _writeVarint(output, tag);
    _writeVarint(output, value);
  }

  static void _writeVarint(List<int> output, int value) {
    var v = value;
    while (v & ~0x7F != 0) {
      output.add((v & 0x7F) | 0x80);
      v = v >> 7;
    }
    output.add(v & 0x7F);
  }

  static List<int> _readVarint(List<int> bytes, int start) {
    int result = 0;
    int shift = 0;
    int i = start;
    while (i < bytes.length) {
      final b = bytes[i];
      result |= (b & 0x7F) << shift;
      if ((b & 0x80) == 0) {
        return [result, i + 1];
      }
      shift += 7;
      if (shift >= 32) throw Exception('Varint too long');
      i++;
    }
    throw Exception('Unexpected end of stream while reading varint');
  }

  static int _skipField(List<int> bytes, int start, int wireType) {
    if (wireType == WIRE_TYPE_VARINT) {
      final v = _readVarint(bytes, start);
      return v[1];
    } else {
      throw Exception('Unsupported wire type: $wireType');
    }
  }

  static bool isValidPageToken(String encodedToken) {
    try {
      decodePageToken(encodedToken);
      return true;
    } catch (_) {
      return false;
    }
  }

  static List<int> extractLimitAndOffset(String encodedToken) {
    final pageToken = decodePageToken(encodedToken);
    return [pageToken.limit, pageToken.offset];
  }
}

extension PageTokenStringExt on String {
  PageToken toPageToken() => PageTokenCrypto.decodePageToken(this);
}
extension PageTokenEncodeExt on PageToken {
  String encode() => PageTokenCrypto.encodePageToken(this);
} 