class ProductFilterItemModel<T> {
  String name;
  String tag;
  T value;

  ProductFilterItemModel({this.name, this.tag, this.value});

  ProductFilterItemModel<T> copyWith({
    String name,
    String tag,
    T value,
  }) =>
      ProductFilterItemModel(
        name: name ?? this.name,
        tag: tag ?? this.tag,
        value: value ?? this.value,
      );
}
