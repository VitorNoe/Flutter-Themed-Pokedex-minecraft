class Item {
  final String name;
  final String namespacedId;
  final String description;
  final String imageUrl;
  final int stackSize;
  final bool renewable;

  Item({
    required this.name,
    required this.namespacedId,
    required this.description,
    required this.imageUrl,
    required this.stackSize,
    required this.renewable,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json["name"],
      namespacedId: json["namespacedId"],
      description: json["description"],
      imageUrl: json["image"],
      stackSize: json["stackSize"],
      renewable: json["renewable"],
    );
  }
}

