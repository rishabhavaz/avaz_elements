part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

class ScanInitial extends ScanState {}

class ScanningState extends ScanState {
  final String currentScanningKey;

  const ScanningState({required this.currentScanningKey});

  @override
  List<Object> get props => [currentScanningKey];
}
