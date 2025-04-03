import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:chic_lyne/features/item_details/ui/components/color_selector_component.dart';
import 'package:chic_lyne/features/item_details/ui/components/size_selector_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'selector_component.dart';
import 'quantity_button_component.dart';
import 'review_item_component.dart';
import 'package:intl/intl.dart';

class ProductInfoComponent extends StatefulWidget {
  final double contentPadding;
  final double titleFontSize;
  final double priceFontSize;
  final double descriptionFontSize;
  final bool isSmallScreen;
  final Products product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductInfoComponent({
    super.key,
    required this.contentPadding,
    required this.titleFontSize,
    required this.priceFontSize,
    required this.descriptionFontSize,
    required this.isSmallScreen,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<ProductInfoComponent> createState() => _ProductInfoComponentState();
}

class _ProductInfoComponentState extends State<ProductInfoComponent> {
  Color? selectedProductColor;
  Size? selectedProductSize;
  @override
  Widget build(BuildContext context) {
    final textSize = widget.isSmallScreen ? 14.0 : 16.0;
    final buttonSize = widget.isSmallScreen ? 24.0 : 28.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.contentPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndPrice(),
          SizedBox(height: widget.isSmallScreen ? 12 : 20),

          // Size selector
          SizeSelectorComponent(
            textSize: textSize,
            isSmallScreen: widget.isSmallScreen,
            sizes: ['S', 'M', 'L', 'XL'],
            onSizeSelected: (size) {
              size;
            },
          ),

          // SelectorComponent(
          //   label: "Size",
          //   textSize: textSize,
          //   child: Row(
          //     children: [
          //       Text(
          //         "S",
          //         style: TextStyle(
          //           fontSize: textSize,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.keyboard_arrow_down),
          //         onPressed: () {},
          //         padding: EdgeInsets.zero,
          //         constraints: const BoxConstraints(),
          //         iconSize: widget.isSmallScreen ? 18 : 24,
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: widget.isSmallScreen ? 8 : 12),

          // Color selector
          ColorSelectorComponent(
            textSize: textSize,
            isSmallScreen: MediaQuery.of(context).size.width < 600,
            colors: [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.black,
            ],
            initialColor: Colors.blue,
            avatarRadius: 12.sp,
            iconSize: 30.sp,
            iconColor: Colors.black,
            labelColor: Colors.black,
            onColorSelected: (color) {
              setState(() {
                selectedProductColor = color;
              });
            },
          ),

          // SelectorComponent(
          //   label: "Color",
          //   textSize: textSize,
          //   child: Row(
          //     children: [
          //       Container(
          //         width: isSmallScreen ? 16 : 20,
          //         height: isSmallScreen ? 16 : 20,
          //         decoration: BoxDecoration(
          //           color: Colors.lightGreen[300],
          //           shape: BoxShape.circle,
          //         ),
          //       ),
          //       IconButton(
          //         icon: const Icon(Icons.keyboard_arrow_down),
          //         onPressed: () {},
          //         padding: EdgeInsets.zero,
          //         constraints: const BoxConstraints(),
          //         iconSize: isSmallScreen ? 18 : 24,
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: widget.isSmallScreen ? 8 : 12),

          // Quantity selector
          SelectorComponent(
            hgt: widget.isSmallScreen ? 40.h : 55.h,
            label: "Quantity",
            textSize: textSize,
            child: Row(
              children: [
                QuantityButtonComponent(
                  icon: Icons.remove,
                  size: buttonSize,
                  onPressed: widget.onDecrement,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.isSmallScreen ? 8.0 : 16.0,
                  ),
                  child: Text(
                    "${widget.quantity}",
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                QuantityButtonComponent(
                  icon: Icons.add,
                  size: buttonSize,
                  onPressed: widget.onIncrement,
                ),
              ],
            ),
          ),

          SizedBox(height: widget.isSmallScreen ? 12 : 20),

          // Description
          Text(
            widget.product.description ?? 'No Description',
            style: TextStyle(
              fontSize: widget.descriptionFontSize,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),

          SizedBox(height: widget.isSmallScreen ? 12 : 20),

          // Shipping info
          _buildShippingInfo(),

          SizedBox(height: widget.isSmallScreen ? 12 : 20),

          // Reviews header
          _buildReviewsHeader(),

          SizedBox(height: widget.isSmallScreen ? 8 : 12),

          // Review items
          _buildReviewItems(),
        ],
      ),
    );
  }

  Widget _buildTitleAndPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product.title ?? 'No Title',
          style: TextStyle(
            fontSize: widget.titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "\$${(widget.product.price ?? 0).toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: widget.priceFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[400],
          ),
        ),
      ],
    );
  }

  Widget _buildShippingInfo() {
    final titleSize = widget.isSmallScreen ? 14.0 : 16.0;
    final textSize = widget.isSmallScreen ? 12.0 : 14.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shipping & Returns",
          style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          "Free standard shipping and free 60-day returns",
          style: TextStyle(fontSize: textSize, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildReviewsHeader() {
    final titleSize = widget.isSmallScreen ? 14.0 : 16.0;
    final ratingSize = widget.isSmallScreen ? 14.0 : 16.0;
    final countSize = widget.isSmallScreen ? 12.0 : 14.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          "${widget.product.rating} Rating",
          style: TextStyle(fontSize: ratingSize, fontWeight: FontWeight.w800),
        ),
        SizedBox(width: 10.w),
        Text(
          "${widget.product.stock.toString()} Reviews",
          // "213 Reviews",
          style: TextStyle(fontSize: countSize, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildReviewItems() {
    return Column(
      children: List.generate(widget.product.reviews!.length, (index) {
        final review = widget.product.reviews![index];
        return Column(
          children: [
            ReviewItemComponent(
              name: review.reviewerName ?? 'No Name',
              rating: review.rating ?? 0,
              imagePath:
                  'assets/man/samuel-lopes-SyPk4FxjTXQ-unsplash.jpg', // مسار محلي كاحتياطي              reviewText: review.comment?? 'No Comment',
              daysAgo: int.tryParse(review.date ?? '') ?? 0,
              isSmallScreen: widget.isSmallScreen,
              textSize: widget.descriptionFontSize,
              reviewText: review.comment ?? 'No Comment',
            ),
            SizedBox(height: widget.isSmallScreen ? 8 : 12),
          ],
        );
      }),
    );
  }

  String _formatDate(int? timestamp) {
    if (timestamp == null) {
      return 'Unknown date';
    }

    // Convert the timestamp to a DateTime object
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    // Get the current date and time
    final now = DateTime.now();
    // Calculate the difference between the current date and the review date
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      // تنسيق التاريخ لعرض اسم الشهر
      final formattedDate = DateFormat('d MMM y', 'ar').format(date);
      return formattedDate;
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
