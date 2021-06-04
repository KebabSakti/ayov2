import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class ProductFilterController extends GetxController {
  ProductFilterController(this.onFilter);

  final Function onFilter;

  ProductFilterModel filterResult = ProductFilterModel(
    palingLaris: ProductFilterItemModel<bool>(
        name: 'Paling Laris', value: false, tag: 'filter'),
    lagiDiskon: ProductFilterItemModel<bool>(
        name: 'Lagi Diskon', value: false, tag: 'filter'),
    ratingEmpat: ProductFilterItemModel<bool>(
        name: 'Rating Tinggi +4', value: false, tag: 'filter'),
    banyakCoin: ProductFilterItemModel<bool>(
        name: 'Banyak Coin', value: false, tag: 'filter'),
    trending: ProductFilterItemModel<bool>(
        name: 'Trending', value: false, tag: 'filter'),
    populer: ProductFilterItemModel<bool>(
        name: 'Populer', value: false, tag: 'filter'),
    pengirimanLangsung: ProductFilterItemModel<bool>(
        name: 'Pengiriman Langsung', value: false, tag: 'filter'),
    pengirimanTerjadwal: ProductFilterItemModel<bool>(
        name: 'Pengiriman Terjadwal', value: false, tag: 'filter'),
    hargaTertinggi: ProductFilterItemModel<bool>(
        name: 'Harga Tertinggi', value: false, tag: 'sorting'),
    hargaTerendah: ProductFilterItemModel<bool>(
        name: 'Harga Terendah', value: false, tag: 'sorting'),
  );

  final RxList<ProductFilterItemModel<bool>> filters = [
    ProductFilterItemModel<bool>(
        name: 'Paling Laris', value: false, tag: 'filter'),
    ProductFilterItemModel<bool>(
        name: 'Lagi Diskon', value: false, tag: 'filter'),
    ProductFilterItemModel<bool>(
        name: 'Rating Tinggi +4', value: false, tag: 'filter'),
    ProductFilterItemModel<bool>(
        name: 'Banyak Coin', value: false, tag: 'filter'),
    ProductFilterItemModel<bool>(name: 'Trending', value: false, tag: 'filter'),
    ProductFilterItemModel<bool>(name: 'Populer', value: false, tag: 'filter'),
    ProductFilterItemModel<bool>(
        name: 'Pengiriman Langsung', value: false, tag: 'filter'),
    ProductFilterItemModel<bool>(
        name: 'Pengiriman Terjadwal', value: false, tag: 'filter'),
    ProductFilterItemModel<bool>(
        name: 'Harga Tertinggi', value: false, tag: 'sorting'),
    ProductFilterItemModel<bool>(
        name: 'Harga Terendah', value: false, tag: 'sorting'),
  ].obs;

  ProductFilterItemModel<bool> _resultHelper(String name) {
    return filters.firstWhere(
      (item) {
        return item.name == name;
      },
      orElse: () {
        return null;
      },
    );
  }

  void onFilterSelected(ProductFilterItemModel<bool> model) {
    filters(filters.map((item) {
      if (item.name == model.name) {
        return model;
      }

      return item;
    }).toList());
  }

  ProductFilterModel _onFilterResult() {
    return filterResult.copyWith(
      palingLaris: _resultHelper('Paling Laris'),
      lagiDiskon: _resultHelper('Lagi Diskon'),
      ratingEmpat: _resultHelper('Rating Tinggi +4'),
      banyakCoin: _resultHelper('Banyak Coin'),
      pengirimanLangsung: _resultHelper('Pengiriman Langsung'),
      pengirimanTerjadwal: _resultHelper('Pengiriman Terjadwal'),
    );
  }

  @override
  void onInit() {
    debounce(filters, (_) {
      onFilter(_onFilterResult());
    }, time: Duration(milliseconds: 500));
    super.onInit();
  }
}
