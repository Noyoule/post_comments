import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<int> {
  ColorCubit() : super(0xFF808080);

  void change(int color) => emit(color);
}