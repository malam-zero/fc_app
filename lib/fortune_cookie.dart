class FortuneCookie {
  final Fortune fortune;

  FortuneCookie({required this.fortune});

  factory FortuneCookie.fromJson(Map<String, Object?> json) {
    final data = json['data'];
    if (data is! Map<String, Object?>) {
      throw FormatException('Missing data object, json=$json');
    }
    return FortuneCookie(fortune: Fortune.fromJson(data));
  }
}

class Fortune {
  final String fortune;
  final String type;
  Fortune({required this.fortune, required this.type});

  factory Fortune.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'fortune': final String fortune, 'type': final String type} => Fortune(
        fortune: fortune,
        type: type,
      ),
      _ => throw FormatException('Could not deserialize Fortune, json=$json'),
    };
  }
}
