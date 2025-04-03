import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color?> {
  ColorCubit() : super(null);

  void updateSelectedColor(Color color) => emit(color);

  void clearSelectedColor() => emit(null);
}