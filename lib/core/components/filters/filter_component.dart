import 'package:chic_lyne/core/components/bottom_sheets/color_filter_sheet.dart';
import 'package:chic_lyne/core/components/bottom_sheets/size_filter_sheet.dart';
import 'package:chic_lyne/core/cubits/filter/filter_cubit.dart';
import 'package:chic_lyne/core/cubits/filter/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterComponent extends StatelessWidget {
  const FilterComponent({super.key});

  void _showColorFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: ColorFilterSheet(
          colorOptions: [
            {'id': 'black', 'name': 'Black', 'value': Colors.black},
            {'id': 'white', 'name': 'White', 'value': Colors.white},
            {'id': 'red', 'name': 'Red', 'value': Colors.red},
            {'id': 'blue', 'name': 'Blue', 'value': Colors.blue},
            {'id': 'green', 'name': 'Green', 'value': Colors.green},
            {'id': 'yellow', 'name': 'Yellow', 'value': Colors.yellow},
            {'id': 'purple', 'name': 'Purple', 'value': Colors.purple},
            {'id': 'orange', 'name': 'Orange', 'value': Colors.orange},
          ],
        ),
      ),
    );
  }

  void _showSizeFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: SizeFilterSheet(
          sizeOptions: ['XS', 'S', 'M', 'L', 'XL', 'XXL', '3XL'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final hasFilters = state is FilterLoaded && state.selectedFilters.isNotEmpty;
        final colorId = state is FilterLoaded ? state.selectedFilters['color'] : null;
        final sizeId = state is FilterLoaded ? state.selectedFilters['size'] : null;
        
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildFilterButton(
                      context: context,
                      label: 'Color',
                      isSelected: colorId != null,
                      selectedValue: _getColorName(colorId),
                      onTap: () => _showColorFilterSheet(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildFilterButton(
                      context: context,
                      label: 'Size',
                      isSelected: sizeId != null,
                      selectedValue: sizeId,
                      onTap: () => _showSizeFilterSheet(context),
                    ),
                  ),
                ],
              ),
            ),
            
            if (hasFilters)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        context.read<FilterCubit>().clearAllFilters();
                      },
                      icon: const Icon(Icons.delete_outline, size: 18),
                      label: const Text('Clear All Filters'),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
  
  String _getColorName(String? colorId) {
    if (colorId == null) return '';
    
    // Map of color IDs to display names
    final colorMap = {
      'black': 'Black',
      'white': 'White',
      'red': 'Red',
      'blue': 'Blue',
      'green': 'Green',
      'yellow': 'Yellow',
      'purple': 'Purple',
      'orange': 'Orange',
    };
    
    return colorMap[colorId] ?? colorId;
  }
  
  Widget _buildFilterButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    String? selectedValue,
    required VoidCallback onTap,
  }) {
    return Material(
      color: isSelected ? Colors.grey.shade200 : Colors.white,
      borderRadius: BorderRadius.circular(8),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected 
                  ? Theme.of(context).primaryColor 
                  : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  if (isSelected && selectedValue != null)
                    Text(
                      selectedValue,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
