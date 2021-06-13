import 'package:ayov2/model/model.dart';

class IntroPageModel {
  IntroPageModel({this.cartItems});

  List<CartItemModel> cartItems;

  IntroPageModel copyWith({List<CartItemModel> cartItems}) =>
      IntroPageModel(cartItems: cartItems ?? this.cartItems);
}
