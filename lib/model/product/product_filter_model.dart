import 'package:ayov2/model/model.dart';

class ProductFilterModel {
  ProductFilterItemModel<bool> palingLaris;
  ProductFilterItemModel<bool> lagiDiskon;
  ProductFilterItemModel<bool> ratingEmpat;
  ProductFilterItemModel<bool> banyakCoin;
  ProductFilterItemModel<bool> trending;
  ProductFilterItemModel<bool> populer;
  ProductFilterItemModel<bool> pengirimanLangsung;
  ProductFilterItemModel<bool> pengirimanTerjadwal;
  ProductFilterItemModel<bool> hargaTertinggi;
  ProductFilterItemModel<bool> hargaTerendah;

  ProductFilterModel({
    this.palingLaris,
    this.lagiDiskon,
    this.ratingEmpat,
    this.banyakCoin,
    this.trending,
    this.populer,
    this.pengirimanLangsung,
    this.pengirimanTerjadwal,
    this.hargaTertinggi,
    this.hargaTerendah,
  });

  ProductFilterModel copyWith({
    ProductFilterItemModel<bool> palingLaris,
    ProductFilterItemModel<bool> lagiDiskon,
    ProductFilterItemModel<bool> ratingEmpat,
    ProductFilterItemModel<bool> banyakCoin,
    ProductFilterItemModel<bool> trending,
    ProductFilterItemModel<bool> populer,
    ProductFilterItemModel<bool> pengirimanLangsung,
    ProductFilterItemModel<bool> pengirimanTerjadwal,
    ProductFilterItemModel<bool> hargaTertinggi,
    ProductFilterItemModel<bool> hargaTerendah,
  }) =>
      ProductFilterModel(
        palingLaris: palingLaris ?? this.palingLaris,
        lagiDiskon: lagiDiskon ?? this.lagiDiskon,
        ratingEmpat: ratingEmpat ?? this.ratingEmpat,
        banyakCoin: banyakCoin ?? this.banyakCoin,
        trending: trending ?? this.trending,
        populer: populer ?? this.populer,
        pengirimanLangsung: pengirimanLangsung ?? this.pengirimanLangsung,
        pengirimanTerjadwal: pengirimanTerjadwal ?? this.pengirimanTerjadwal,
        hargaTerendah: hargaTerendah ?? this.hargaTerendah,
        hargaTertinggi: hargaTertinggi ?? this.hargaTertinggi,
      );
}
