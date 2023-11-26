part of 'bloc.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class MainInitial extends MainState {}

final class MainLoading extends MainState {}

final class MainFailure extends MainState {
  final String msg;
  const MainFailure(this.msg);
  @override
  List<Object> get props => [msg];
}

final class MainSuccess extends MainState {
  final Position position;

  const MainSuccess({required this.position});
  @override
  List<Object> get props => [position];
}
