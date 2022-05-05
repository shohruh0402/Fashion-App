import 'package:bloc/bloc.dart';

class SavatCubit extends Cubit<SavatState> {
  SavatCubit() : super(SavatInitial());
  bool like = false;
  likebos() {
    like =! like;
    emit(SavatLike());
  }
}

abstract class SavatState {
  const SavatState();
}

class SavatInitial extends SavatState {
  const SavatInitial();
}

class SavatLike extends SavatState {
  SavatLike();
}
