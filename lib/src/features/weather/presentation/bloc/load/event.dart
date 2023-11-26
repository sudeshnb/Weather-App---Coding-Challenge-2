part of 'bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class DeterminePosition extends MainEvent {}
