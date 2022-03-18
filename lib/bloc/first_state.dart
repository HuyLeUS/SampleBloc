part of 'first_bloc_bloc.dart';

@immutable
class FirstState extends Equatable {
  final String name;

  const FirstState({required this.name});
  factory FirstState.initial() {
    return const FirstState(name: "");
  }

  @override
  List<Object?> get props => [name];

  FirstState copyWith({
    String? name,
  }) {
    return FirstState(
      name: name ?? this.name,
    );
  }
}
