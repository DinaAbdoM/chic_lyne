import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterState> {
  // تهيئة الحالة الأولية للكيوبت
  FilterCubit()
    : super(
        FilterState(
          selectedItems: [
            'Deals',
            'Price',
            'Sort by',
            'Gender',
          ], // عناوين الفلاتر الافتراضية
          selectedIndex: null, // لا يوجد عنصر محدد في البداية
          selectedFilterCount: 0, // عدد الفلاتر المحددة في البداية صفر
          selectedOptions: List.generate(
            4,
            (_) => null,
          ), // قائمة لتتبع الخيارات المحددة لكل فلتر (null يعني لا يوجد خيار)
        ),
      );

  // تحديث الخيار المحدد لفلتر معين
  void updateSelectedItem(int containerIndex, String newValue) {
    List<String> updatedItems = List.from(
      state.selectedItems,
    ); // نسخ قائمة عناوين الفلاتر
    updatedItems[containerIndex] = newValue; // تحديث عنوان الفلتر المحدد

    List<String?> updatedOptions = List.from(
      state.selectedOptions,
    ); // نسخ قائمة الخيارات المحددة

    if (updatedOptions[containerIndex] == null) {
      // إذا كان الخيار جديدًا (لم يتم تحديد خيار من قبل لهذا الفلتر)
      emit(
        state.copyWith(
          selectedItems: updatedItems,
          selectedFilterCount:
              state.selectedFilterCount + 1, // زيادة عدد الفلاتر المحددة
          selectedOptions: updatedOptions..[containerIndex] = newValue,
        ),
      ); // تحديث الخيار المحدد
    } else {
      // إذا تم تغيير الخيار (تم تحديد خيار من قبل لهذا الفلتر)
      emit(
        state.copyWith(
          selectedItems: updatedItems,
          selectedOptions: updatedOptions..[containerIndex] = newValue,
        ),
      ); // تحديث الخيار المحدد فقط
    }
  }

  // تحديث العنصر المحدد (لأغراض أخرى، ليس له علاقة بالفلاتر المحددة)
  void updateSelectedIndex(int? index) {
    emit(state.copyWith(selectedIndex: index));
  }

  // مسح الخيار المحدد لفلتر معين
  void clearSelectedItem(int containerIndex, List<String> defaultTitles) {
    List<String> updatedItems = List.from(
      state.selectedItems,
    ); // نسخ قائمة عناوين الفلاتر

    // التحقق من صحة فهرس الفلتر
    if (containerIndex >= 0 &&
        containerIndex < defaultTitles.length &&
        containerIndex < defaultTitles.length) {
      updatedItems[containerIndex] =
          defaultTitles[containerIndex]; // استعادة العنوان الافتراضي للفلتر
    } else {
      print('Error: containerIndex out of range');
    }

    List<String?> updatedOptions = List.from(
      state.selectedOptions,
    ); // نسخ قائمة الخيارات المحددة

    if (updatedOptions[containerIndex] != null) {
      // إذا كان هناك خيار محدد لهذا الفلتر
      emit(
        state.copyWith(
          selectedItems: updatedItems,
          selectedFilterCount:
              state.selectedFilterCount - 1, // تقليل عدد الفلاتر المحددة
          selectedOptions: updatedOptions..[containerIndex] = null,
        ),
      ); // مسح الخيار المحدد
    } else {
      // إذا لم يكن هناك خيار محدد لهذا الفلتر
      emit(
        state.copyWith(selectedItems: updatedItems),
      ); // تحديث عناوين الفلاتر فقط
    }
  }
}

class FilterState {
  final List<String> selectedItems; // قائمة عناوين الفلاتر
  final int? selectedIndex; // العنصر المحدد (لأغراض أخرى)
  final int selectedFilterCount; // عدد الفلاتر المحددة
  final List<String?> selectedOptions; // قائمة الخيارات المحددة لكل فلتر

  // تهيئة حالة الفلاتر
  FilterState({
    required this.selectedItems,
    this.selectedIndex,
    required this.selectedFilterCount,
    required this.selectedOptions,
  });

  // إنشاء نسخة من الحالة مع تحديث بعض الخصائص
  FilterState copyWith({
    List<String>? selectedItems,
    int? selectedIndex,
    int? selectedFilterCount,
    List<String?>? selectedOptions,
  }) {
    return FilterState(
      selectedItems: selectedItems ?? this.selectedItems,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedFilterCount: selectedFilterCount ?? this.selectedFilterCount,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }
}
