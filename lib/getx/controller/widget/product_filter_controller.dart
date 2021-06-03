import 'package:ayov2/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductFilterController extends GetxController {
  ProductFilterController(this.onFilter);

  final ValueChanged<ProductFilterModel> onFilter;

  final Rx<ProductFilterModel> options = ProductFilterModel(
    palingLaris:
        ProductFilterItemModel<bool>(name: 'Paling Laris', value: false),
    lagiDiskon: ProductFilterItemModel<bool>(name: 'Lagi Diskon', value: false),
    ratingEmpat:
        ProductFilterItemModel<bool>(name: 'Rating Tinggi +4', value: false),
    banyakCoin: ProductFilterItemModel<bool>(name: 'Banyak Coin', value: false),
    trending: ProductFilterItemModel<bool>(name: 'Trending', value: false),
    populer: ProductFilterItemModel<bool>(name: 'Populer', value: false),
    pengirimanLangsung:
        ProductFilterItemModel<bool>(name: 'Pengiriman Langsung', value: false),
    pengirimanTerjadwal: ProductFilterItemModel<bool>(
        name: 'Pengiriman Terjadwal', value: false),
    hargaTertinggi:
        ProductFilterItemModel<bool>(name: 'Harga Tertinggi', value: false),
    hargaTerendah:
        ProductFilterItemModel<bool>(name: 'Harga Terendah', value: false),
  ).obs;

  void palingLaris(bool value) {
    options(options.value.copyWith(
        palingLaris: options.value.palingLaris.copyWith(value: value)));
  }

  void ratingTinggi(bool value) {
    options(options.value.copyWith(
        ratingEmpat: options.value.ratingEmpat.copyWith(value: value)));
  }

  void banyakCoin(bool value) {
    options(options.value
        .copyWith(banyakCoin: options.value.banyakCoin.copyWith(value: value)));
  }

  @override
  void onInit() {
    debounce(options, (_) {
      onFilter(options.value);
    }, time: Duration(milliseconds: 500));

    super.onInit();
  }
}
