import 'package:flutter/material.dart';

class GenericBottomSheet<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final Function(T) onItemSelected;
  final String title;
  final Widget Function(T) itemBuilder; // دالة لبناء عنصر القائمة
  final String Function(T)
  itemLabelBuilder; // إضافة دالة للحصول على اسم العنصر
  final bool?
  showColorPreview; // إضافة متغير لتحديد ما إذا كان سيتم عرض معاينة اللون
  const GenericBottomSheet({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
    required this.title,
    required this.itemBuilder,
    required this.itemLabelBuilder,
    this.showColorPreview = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  // يمكنك إضافة منطق لمسح العنصر المحدد هنا
                },
                child: const Text(
                  'Clear',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, size: 28),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isSelected = selectedItem == item;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5,
                ),
                child: Material(
                  color: isSelected ? Colors.deepPurple : Colors.grey[300],
                  borderRadius: BorderRadius.circular(18.0),
                  child: InkWell(
                    onTap: () {
                      onItemSelected(item);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  itemLabelBuilder(item)  , // عرض اسم العنصر هنا
                                  style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(Icons.check, color: Colors.white),
                              ],
                            ),
                          ),
                          if (showColorPreview!)
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    isSelected
                                        ? Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        )
                                        : null,
                              ),
                              child: itemBuilder(item), // عرض معاينة اللون هنا
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
