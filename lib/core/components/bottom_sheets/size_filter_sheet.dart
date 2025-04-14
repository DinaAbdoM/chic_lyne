import 'package:chic_lyne/core/components/bottom_sheets/responsive_bottom_sheet_layout.dart';
import 'package:chic_lyne/core/cubits/filter/filter_cubit.dart';
import 'package:chic_lyne/core/cubits/filter/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeFilterSheet extends StatelessWidget {
  final List<String> sizeOptions;
  
  const SizeFilterSheet({
    super.key,
    required this.sizeOptions,
  });
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final selectedSize = state is FilterLoaded 
            ? state.selectedFilters['size']
            : null;
            
        return ResponsiveBottomSheetLayout(
          title: 'Size',
          clearAction: () {
            context.read<FilterCubit>().clearSelectedItem('size');
            Navigator.pop(context);
          },
          body: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: sizeOptions.length,
            itemBuilder: (context, index) {
              final size = sizeOptions[index];
              final isSelected = selectedSize == size;
              
              return GestureDetector(
                onTap: () {
                  context.read<FilterCubit>().updateSelectedItem('size', size);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? Theme.of(context).primaryColor 
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    size,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}