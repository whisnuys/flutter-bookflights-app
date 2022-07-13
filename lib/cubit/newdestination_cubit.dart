import 'package:bloc/bloc.dart';
import 'package:bookflights/models/destination_model.dart';
import 'package:bookflights/services/new_destination_service.dart';
import 'package:equatable/equatable.dart';

part 'newdestination_state.dart';

class NewdestinationCubit extends Cubit<NewdestinationState> {
  NewdestinationCubit() : super(NewdestinationInitial());

  void fetchNewDestinations() async {
    try {
      emit(NewDestinationLoading());
      List<DestinationModel> newDestinations =
          await NewDestinationService().fetchNewDestinations();
      emit(NewDestinationSuccess(newDestinations));
    } catch (e) {
      emit(NewDestinationFailed(e.toString()));
    }
  }
}
