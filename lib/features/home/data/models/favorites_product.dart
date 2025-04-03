// class Product {
//   // خاصية تمثل رابط الصورة المصغرة للمنتج.
//   final String? thumbnail;

//   // خاصية تمثل عنوان المنتج.
//   final String? title;

//   // خاصية تمثل سعر المنتج.
//   final double? price;

//   // البناء (Constructor) لإنشاء كائن Product.
//   Product({this.thumbnail, this.title, this.price});

//   // دالة تُستخدم لتحويل خريطة (Map) JSON إلى كائن Product.
//   // تُستخدم هذه الدالة عند استقبال بيانات المنتج من واجهة برمجة التطبيقات (API).
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       // استخراج قيمة 'thumbnail' من خريطة JSON.
//       thumbnail: json['thumbnail'],
//       // استخراج قيمة 'title' من خريطة JSON.
//       title: json['title'],
//       // استخراج قيمة 'price' من خريطة JSON وتحويلها إلى double.
//       // إذا كانت القيمة null، يتم تجاهلها.
//       price: json['price']?.toDouble(),
//     );
//   }

//   // دالة تُستخدم لتحويل كائن Product إلى خريطة (Map) JSON.
//   // تُستخدم هذه الدالة عند إرسال بيانات المنتج إلى واجهة برمجة التطبيقات (API).
//   Map<String, dynamic> toJson() {
//     return {
//       // إضافة قيمة 'thumbnail' إلى خريطة JSON.
//       'thumbnail': thumbnail,
//       // إضافة قيمة 'title' إلى خريطة JSON.
//       'title': title,
//       // إضافة قيمة 'price' إلى خريطة JSON.
//       'price': price,
//     };
//   }

//   // دالة تُستخدم لمقارنة كائنين Product.
//   // تُستخدم عند التحقق من تساوي كائنين Product.
//   @override
//   bool operator ==(Object other) =>
//       // التحقق من أن الكائنين متطابقين في الذاكرة.
//       identical(this, other) ||
//       // التحقق من أن الكائن الآخر هو من نوع Product.
//       other is Product &&
//           // التحقق من أن نوع وقت التشغيل للكائنين متطابق.
//           runtimeType == other.runtimeType &&
//           // التحقق من أن خاصية 'thumbnail' متطابقة.
//           thumbnail == other.thumbnail &&
//           // التحقق من أن خاصية 'title' متطابقة.
//           title == other.title &&
//           // التحقق من أن خاصية 'price' متطابقة.
//           price == other.price;

//   // دالة تُستخدم لحساب رمز التجزئة (hashCode) للكائن.
//   // تُستخدم عند استخدام كائن Product كمفتاح في خريطة (Map) أو مجموعة (Set).
//   @override
//   int get hashCode => thumbnail.hashCode ^ title.hashCode ^ price.hashCode;
// }