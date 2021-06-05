enum JenisPengiriman { TERJADWAL, INSTANT }

class ProductFilterModel {
  bool palingLaris;
  bool lagiDiskon;
  bool ratingEmpat;
  bool banyakCoin;
  bool trending;
  bool populer;
  bool hargaTertinggi;
  bool hargaTerendah;
  JenisPengiriman jenisPengiriman;
  String kategori;
  String subKategori;
  String productId;

  ProductFilterModel({
    this.palingLaris = false,
    this.lagiDiskon = false,
    this.ratingEmpat = false,
    this.banyakCoin = false,
    this.trending = false,
    this.populer = false,
    this.hargaTertinggi = false,
    this.hargaTerendah = false,
    this.jenisPengiriman,
  });

  ProductFilterModel copyWith({
    bool palingLaris,
    bool lagiDiskon,
    bool ratingEmpat,
    bool banyakCoin,
    bool trending,
    bool populer,
    bool hargaTertinggi,
    bool hargaTerendah,
    JenisPengiriman jenisPengiriman,
  }) =>
      ProductFilterModel(
        palingLaris: palingLaris ?? this.palingLaris,
        lagiDiskon: lagiDiskon ?? this.lagiDiskon,
        ratingEmpat: ratingEmpat ?? this.ratingEmpat,
        banyakCoin: banyakCoin ?? this.banyakCoin,
        trending: trending ?? this.trending,
        populer: populer ?? this.populer,
        hargaTerendah: hargaTerendah ?? this.hargaTerendah,
        hargaTertinggi: hargaTertinggi ?? this.hargaTertinggi,
        jenisPengiriman: jenisPengiriman ?? this.jenisPengiriman,
      );
}
