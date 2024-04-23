import 'package:flutter_bloc/flutter_bloc.dart';

class FontCubit extends Cubit<String> {
  FontCubit() : super("Poppins");

  void change(String font) => emit(font);
}