class Quote {
  String translation;
  String content;
  Quote({this.content, this.translation});
  factory Quote.fromJson(Map<String, dynamic> parsedJson) {
    return Quote(content: parsedJson['content'], translation: parsedJson['translation']);
  }
}