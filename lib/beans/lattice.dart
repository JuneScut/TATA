class Lattice {
  String title;
  String content;
  Lattice(this.title, this.content); 
  String get getTitle => title;

  set setTitle(String title) => this.title = title;

  String get getContent => content;

  set setContent(String content) => this.content = content;

   Lattice.fromJson(Map<String, String> json)
      : title = json['title'],
        content = json['content'];

  Map<String, String> toJson() =>
    <String, String>{
      'title': title,
      'content': content,
    };

}