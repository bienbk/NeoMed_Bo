String formatNumber(String value) {
  if (value.length > 2) {
    return value
        .replaceAll(RegExp(r'\D'), '')
        .replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
  } else {
    return value;
  }
}
