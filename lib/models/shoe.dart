class Shoe {
  final String name;
  final double price;
  final String category;
  final String imagePath;
  final List<int> size;
  bool isLiked;
  int quantity;
  double updatedPrice;

  Shoe(
    this.name,
    this.price,
    this.category,
    this.imagePath, 
    this.size,
    this.isLiked, {
    this.quantity = 1,
  }) : updatedPrice = price * quantity;

  double get totalPrice {
    return price * quantity;
  }

  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
    updatedPrice = price * quantity;
  }
}
