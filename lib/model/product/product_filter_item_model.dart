class ProductFilterItemModel<T> {
  String name;
  T value;

  ProductFilterItemModel({this.name, this.value});

  ProductFilterItemModel copyWith({
    String name,
    T value,
  }) =>
      ProductFilterItemModel(
        name: name ?? this.name,
        value: value ?? this.value,
      );
}
