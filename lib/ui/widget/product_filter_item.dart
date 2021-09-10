import 'package:flutter/material.dart';

class ProductFilterItem extends StatelessWidget {
  final bool selected;
  final Function onSelected;
  final Widget child;

  ProductFilterItem({
    @required this.selected,
    @required this.onSelected,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      onSelected: onSelected,
      label: child,
    );
  }
}
