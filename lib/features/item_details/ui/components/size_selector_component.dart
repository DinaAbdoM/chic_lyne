import 'package:chic_lyne/core/widgets/generic_bottom_sheet.dart';
import 'package:chic_lyne/features/fliter_view/ui/widgets/custom_bottom_sheet.dart';
import 'package:chic_lyne/features/item_details/logic/cubits/size_cubit.dart';
import 'package:chic_lyne/features/item_details/ui/components/selector_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeSelectorComponent extends StatefulWidget {
  final double textSize;
  final bool isSmallScreen;
  final List<String> sizes;
  final Function(String) onSizeSelected;

  const SizeSelectorComponent({
    super.key,
    required this.textSize,
    required this.isSmallScreen,
    required this.sizes,
    required this.onSizeSelected,
  });

  @override
  _SizeSelectorComponentState createState() => _SizeSelectorComponentState();
}

class _SizeSelectorComponentState extends State<SizeSelectorComponent> {
  String? _selectedSize;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _selectedSize = widget.sizes.first;
  }

  // void _showSizeBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children:
  //             widget.sizes
  //                 .map(
  //                   (size) => ListTile(
  //                     title: Text(size),
  //                     onTap: () {
  //                       setState(() {
  //                         _selectedSize = size;
  //                       });
  //                       widget.onSizeSelected(size);
  //                       Navigator.pop(context);
  //                     },
  //                   ),
  //                 )
  //                 .toList(),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SelectorComponent(
      label: "Size",
      textSize: widget.textSize,
      child: Row(
        children: [
          Text(
            _selectedSize ?? "S",
            style: TextStyle(
              fontSize: widget.textSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => SizeCubit(), // توفير SizeCubit هنا
                    child: BlocBuilder<SizeCubit, String?>(
                      builder: (context, state) {
                        // return SizeBottomSheet(
                        //   sizes: widget.sizes,
                        //   selectedSize: state,
                        //   onSizeSelected: (size) {
                        //     setState(() {
                        //       _selectedSize = size;
                        //     });
                        //     widget.onSizeSelected(size);
                        //   },
                        // );
                        return GenericBottomSheet<String>(
                          items: widget.sizes,
                          selectedItem: state,
                          onItemSelected: (size) {
                            context.read<SizeCubit>().updateSelectedSize(size);
                            setState(() {
                              _selectedSize = size;
                            });
                            widget.onSizeSelected(size);
                            Navigator.pop(context);
                          },
                          title: "Select Size",
                          itemBuilder:
                              (size) => Text(
                                size,
                                style: const TextStyle(fontSize: 18),
                              ),
                          itemLabelBuilder: (String size) {
                            return size;
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },

            // _showSizeBottomSheet(context),
            padding: EdgeInsets.zero,
            iconSize: widget.isSmallScreen ? 18.sp : 24.sp,
          ),
        ],
      ),
    );
  }
}

/// A responsive, reusable dialog component that follows clean code principles.
/// This can be easily refactored and maintained.
// class ResponsiveDialog extends StatelessWidget {
//   final String title;
//   final String message;
//   final String confirmButtonText;
//   final String? cancelButtonText;
//   final VoidCallback onConfirm;
//   final VoidCallback? onCancel;
//   final Widget? content;

//   const ResponsiveDialog({
//     super.key,
//     required this.title,
//     required this.message,
//     required this.confirmButtonText,
//     this.cancelButtonText,
//     required this.onConfirm,
//     this.onCancel,
//     this.content,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: _buildDialogContent(context),
//     );
//   }

//   Widget _buildDialogContent(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Theme.of(context).dialogBackgroundColor,
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10.0,
//             offset: Offset(0.0, 10.0),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text(
//             title,
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             message,
//             style: const TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//           if (content != null) ...[const SizedBox(height: 16), content!],
//           const SizedBox(height: 24),
//           _buildButtons(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildButtons(BuildContext context) {
//     // Responsive button layout based on screen width
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth < 300 || cancelButtonText == null) {
//           // For small screens or single button, stack buttons vertically
//           return Column(
//             children: [
//               _buildConfirmButton(context),
//               if (cancelButtonText != null) ...[
//                 const SizedBox(height: 8),
//                 _buildCancelButton(context),
//               ],
//             ],
//           );
//         } else {
//           // For larger screens with two buttons, place them side by side
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(child: _buildCancelButton(context)),
//               const SizedBox(width: 16),
//               Expanded(child: _buildConfirmButton(context)),
//             ],
//           );
//         }
//       },
//     );
//   }

//   Widget _buildConfirmButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onConfirm,
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size(double.infinity, 45),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       child: Text(confirmButtonText),
//     );
//   }

//   Widget _buildCancelButton(BuildContext context) {
//     return OutlinedButton(
//       onPressed: onCancel ?? () => Navigator.of(context).pop(),
//       style: OutlinedButton.styleFrom(
//         minimumSize: const Size(double.infinity, 45),
//         side: BorderSide(color: Theme.of(context).primaryColor),
//       ),
//       child: Text(cancelButtonText ?? 'Cancel'),
//     );
//   }
// }

// // Example usage:
// void showCustomDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return ResponsiveDialog(
//         title: 'Confirmation',
//         message: 'Are you sure you want to proceed with this action?',
//         confirmButtonText: 'Confirm',
//         cancelButtonText: 'Cancel',
//         onConfirm: () {
//           // Handle confirmation action
//           Navigator.of(context).pop();
//         },
//         // Optional custom content
//         content: const Icon(
//           Icons.check_circle_outline,
//           size: 60,
//           color: Colors.green,
//         ),
//       );
//     },
//   );
// }

// class SizeBottomSheet extends StatelessWidget {
//   final List<String> sizes; // قائمة الأحجام
//   final String? selectedSize; // الحجم المحدد مسبقًا
//   final Function(String) onSizeSelected;

//   const SizeBottomSheet({
//     super.key,
//     required this.onSizeSelected,
//     required this.sizes,
//     this.selectedSize,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   context.read<SizeCubit>().clearSelectedSize();
//                   Navigator.pop(context);
//                 },
//                 child: const Text(
//                   'Clear',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const Text(
//                 'Select Size',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               IconButton(
//                 onPressed: () => Navigator.pop(context),
//                 icon: const Icon(Icons.close, size: 28),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: sizes.length,
//             itemBuilder: (context, index) {
//               final size = sizes[index];
//               final isSelected = selectedSize == size;
//               return Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10.0,
//                   vertical: 5,
//                 ),
//                 child: Material(
//                   color: isSelected ? Colors.deepPurple : Colors.grey[300],
//                   borderRadius: BorderRadius.circular(18.0),
//                   child: InkWell(
//                     onTap: () {
//                       context.read<SizeCubit>().updateSelectedSize(size);
//                       onSizeSelected(size);
//                       Navigator.pop(context);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 18.0,
//                         vertical: 15.0,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               size,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: isSelected ? Colors.white : Colors.black,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           if (isSelected)
//                             const Icon(Icons.check, color: Colors.white),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
