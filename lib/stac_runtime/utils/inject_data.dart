/// Recursively replaces `{{key}}` values while preserving exact typed values.
dynamic injectData(dynamic value, Map<String, dynamic> data) {
  if (value is String) {
    final exact = RegExp(r'^\{\{([^}]+)\}\}$').firstMatch(value);
    if (exact != null && data.containsKey(exact.group(1))) {
      return data[exact.group(1)];
    }
    var result = value;
    data.forEach((key, item) {
      result = result.replaceAll('{{$key}}', item?.toString() ?? '');
    });
    return result;
  }
  if (value is Map) {
    return value.map(
      (key, item) => MapEntry(key.toString(), injectData(item, data)),
    );
  }
  if (value is List) {
    return value.map((item) => injectData(item, data)).toList();
  }
  return value;
}
