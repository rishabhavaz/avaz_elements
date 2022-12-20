part of 'scan_bloc.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object> get props => [];
}

class StartScanning extends ScanEvent {}

class OnSwitchPressed extends ScanEvent {}
