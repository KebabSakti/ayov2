import 'package:ayov2/util/enums.dart';

class StateModel<T> {
  States state;
  T data;

  StateModel({
    this.state,
    this.data,
  });

  StateModel<T> copyWith({
    States state,
    T data,
  }) =>
      StateModel(
        state: state ?? this.state,
        data: data ?? this.data,
      );
}
