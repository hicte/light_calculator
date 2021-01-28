String sepByComma(String org) {
  String formatted = '';

  for (var i = 0; i < org.length; i++) {
    formatted += org[i];
    if ((org.length - (i + 1)) % 3 == 0 && (i + 1) != org.length)
      formatted += ',';
  }

  return formatted;
}

String cleanResult(double result) {
  String cleaned = '';

  if (result == result.round()) {
    cleaned = result.round().toString();
    cleaned = sepByComma(cleaned);
  } else {
    cleaned = result.toStringAsFixed(4).replaceAll(RegExp(r'0+$'), '');
    List<String> splitted = cleaned.split('.');
    cleaned = sepByComma(splitted[0]) + '.' + splitted[1];
  }

  return cleaned;
}
