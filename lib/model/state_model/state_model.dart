enum States { init, loading, moreLoading, complete, error }

class StateModel {
  States state;
  dynamic data;

  StateModel({
    this.state,
    this.data,
  });

  StateModel copyWith({
    States state,
    dynamic data,
  }) =>
      StateModel(
        state: state ?? this.state,
        data: data ?? this.data,
      );
}
