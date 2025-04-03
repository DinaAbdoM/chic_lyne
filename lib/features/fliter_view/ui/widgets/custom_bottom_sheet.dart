import 'package:chic_lyne/features/fliter_view/logic/filter_cubit/filter_cubit.dart';
import 'package:chic_lyne/features/fliter_view/logic/sortby_cubit/sort_by_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheet extends StatelessWidget {
  final int containerIndex;
  final List<String> allItems;
  final String defaultTitle;
  final String selectedItem;

  const CustomBottomSheet({
    super.key,
    required this.containerIndex,
    required this.allItems,
    required this.defaultTitle,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<FilterCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  context.read<FilterCubit>().clearSelectedItem(
                    containerIndex,
                    ['Deals', 'Price', 'Sort by', 'Gender'],
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Clear',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                defaultTitle,
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
            itemCount: allItems.length,
            itemBuilder: (context, index) {
              final itemText = allItems[index];
              final isSelected = selectedItem == itemText;
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
                      filterCubit.updateSelectedItem(containerIndex, itemText);
                      Navigator.pop(context);
                      if (containerIndex == 1) {
                        // Price
                        context.read<SortByCubit>().getSortBy(
                          'price',
                          itemText == 'Min' ? 'asc' : 'desc',
                        );
                      } else if (containerIndex == 2) {
                        // Sort by
                        context.read<SortByCubit>().getSortBy(
                          'rating',
                          itemText == 'Lowest - Highest Price' ? 'asc' : 'desc',
                        );
                      }
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
                            child: Text(
                              itemText,
                              style: TextStyle(
                                fontSize: 18,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isSelected)
                            const Icon(Icons.check, color: Colors.white),
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
