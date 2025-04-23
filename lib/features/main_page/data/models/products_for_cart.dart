
import 'package:image_picker/image_picker.dart';

class OrderItem {
  int quantity;
  String item;
  XFile? image;
  String? note;
  OrderItem(this.quantity, this.item,[this.image,this.note]);
}
