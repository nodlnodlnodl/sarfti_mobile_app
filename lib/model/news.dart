class newsParser {
  int? id;
  String? header;
  String? headerRef;
  String? img;
  String? textOfArticle;
  String? date;

  newsParser(
      {this.id,
      this.header,
      this.headerRef,
      this.img,
      this.textOfArticle,
      this.date});

  newsParser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    headerRef = json['header_ref'];
    img = json['img'];
    textOfArticle = json['text_of_article'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['header_ref'] = this.headerRef;
    data['img'] = this.img;
    data['text_of_article'] = this.textOfArticle;
    data['date'] = this.date;
    return data;
  }

  toList() {}
}