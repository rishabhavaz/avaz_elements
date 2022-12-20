part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

class ScanInitial extends ScanState {}

class ScanningState extends ScanState {
  final String currentScanKey;

  const ScanningState({required this.currentScanKey});

  @override
  List<Object> get props => [currentScanKey];
}
