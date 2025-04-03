import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCubit extends Cubit<String?> {
  SizeCubit() : super(null); // الحالة الأولية هي null (لا يوجد حجم محدد)

  void updateSelectedSize(String size) {
    emit(size); // تحديث الحجم المحدد
  }

  void clearSelectedSize() {
    emit(null); // مسح الحجم المحدد
  }
}