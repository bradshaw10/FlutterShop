import '../item/item.dart';
import 'package:uuid/uuid.dart';

class ShoppingCart {
  final orderId = Uuid().v4();

  List<Item> items = [];

  bool get isEmpty => items.isEmpty;
  int get numOfItems => items.length;

  int get totalPrice {
    int totalPrice = 0;
    items.forEach((element) {
      totalPrice += element.price;
    });

    return totalPrice;
  }

  String get formattedTotalPrice {
    if (isEmpty) {
      return Item.formatter.format(0);
    }

    return Item.formatter.format(this.totalPrice);
  }

  bool isExists(item) {
    if (items.isEmpty) {
      return false;
    }

    final indexOfItem = items.indexWhere((element) => item.id == element.id);
    return indexOfItem >= 0;
  }
}
