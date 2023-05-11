class City {
  final int id;
  final String nameEn;
  City({
    required this.id,
    required this.nameEn,
  });
  factory City.fromJson(Map<String ,dynamic> json) =>
      City(
        id: json['id'],
        nameEn: json['name_en'],
      );
}
