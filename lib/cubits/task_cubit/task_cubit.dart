import 'package:bloc/bloc.dart';

class TaskCubit extends Cubit<bool> {
  TaskCubit() : super(false);

  toggleCheckbox(bool checkBoxValue) {
    emit(checkBoxValue);
  }
}
