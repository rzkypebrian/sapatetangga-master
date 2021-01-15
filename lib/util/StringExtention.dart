import 'dart:convert';

extension StringExtenction on String {
  bool isNullOrEmpty() {
    if (this == null) {
      return true;
    } else if (this.isEmpty) {
      return true;
    }
    return false;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  Map<String, dynamic> decode() {
    return json.decode(this);
  }
}
