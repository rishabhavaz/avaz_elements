import 'package:avaz_elements/constants/scanning_keys.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitial()) {
    List<String> parentScanningKeys = scanKeys.keys.toList();
    on<StartScanning>((event, emit) {
      
    });
  }
}
