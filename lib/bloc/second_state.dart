part of 'second_bloc.dart';

class SecondState extends Equatable {
  const SecondState({
    required this.listMeme,
    required this.isLoading,
  });
  final List<MemeModel?> listMeme;
  final bool isLoading;
  factory SecondState.initial() {
    return const SecondState(
      listMeme: [],
      isLoading: false,
    );
  }
  SecondState copyWith(
      {List<MemeModel>? listMeme,
      bool? isLoading,
      bool? loadingSuccess,
      bool? loadingFailed}) {
    return SecondState(
        listMeme: listMeme ?? this.listMeme, isLoading: isLoading ?? false);
  }

  @override
  List<Object> get props => [listMeme, isLoading];
}
