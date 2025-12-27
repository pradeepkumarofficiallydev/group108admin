class MenuItem {
  final String title;
  final String image;
  final String screen;

  MenuItem({required this.title, required this.image, required this.screen});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      title: json['title'],
      image: json['image'],
      screen: json['screen'],
    );
  }
}
