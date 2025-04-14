import 'package:chic_lyne/core/di/dependency_injection.dart';
import 'package:chic_lyne/features/carts/logic/bloc/cart_bloc.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:chic_lyne/features/item_details/ui/components/add_to_cart_button_component.dart';
import 'package:chic_lyne/features/item_details/ui/components/app_bar_component.dart';
import 'package:chic_lyne/features/item_details/ui/components/product_images_component.dart';
import 'package:chic_lyne/features/item_details/ui/components/product_info_component.dart';
import 'package:chic_lyne/features/top_selling/domain/entities/top_selling_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetails extends StatefulWidget {
  final Productss product;
  const ItemDetails({super.key, required this.product});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final isSmallScreen = screenSize.width < 360;
    final isMediumScreen = screenSize.width >= 360 && screenSize.width < 600;
    final isLargeScreen = screenSize.width >= 600;

    // Adjust sizes based on screen size
    final contentPadding =
        isSmallScreen ? 10.0 : (isMediumScreen ? 16.0 : 24.0);
    final titleFontSize = isSmallScreen ? 18.0 : (isMediumScreen ? 20.0 : 24.0);
    final priceFontSize = isSmallScreen ? 16.0 : (isMediumScreen ? 18.0 : 22.0);
    final descriptionFontSize =
        isSmallScreen ? 12.0 : (isMediumScreen ? 14.0 : 16.0);
    final buttonTextFontSize =
        isSmallScreen ? 14.0 : (isMediumScreen ? 16.0 : 18.0);

    // Adjust image gallery height based on screen size
    final imageGalleryHeight =
        isSmallScreen
            ? screenSize.height * 0.25
            : (isMediumScreen
                ? screenSize.height * 0.3
                : screenSize.height * 0.35);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: isSmallScreen ? 10 : 16),
              AppBarComponent(padding: contentPadding),
              SizedBox(height: isSmallScreen ? 10 : 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImagesComponent(
                        images: widget.product.images ?? [],
                        height: imageGalleryHeight,
                        padding: contentPadding,
                      ),
                      SizedBox(height: isSmallScreen ? 12 : 20),
                      ProductInfoComponent(
                        contentPadding: contentPadding,
                        titleFontSize: titleFontSize,
                        priceFontSize: priceFontSize,
                        descriptionFontSize: descriptionFontSize,
                        isSmallScreen: isSmallScreen,
                        product: widget.product,
                        quantity: quantity,
                        onIncrement: incrementQuantity,
                        onDecrement: decrementQuantity,
                      ),
                      AddToBagButtonComponent(
                        padding: contentPadding,
                        fontSize: buttonTextFontSize,
                        price: widget.product.price ?? 0,
                        quantity: quantity,
                        cartModelProduct: widget.product,
                      ),
                      SizedBox(height: isSmallScreen ? 40 : 80),
                    ],
                  ),
                ),
              ),
              BlocProvider(
                create: (_) => getIt<CartBloc>(),
                child: Container(),
                // child: AddToBagButtonComponent(
                //   cartModelProduct: ,
                //   product: widget.product,
                //   padding: contentPadding,
                //   fontSize: buttonTextFontSize,
                //   price: widget.product.price ?? 0,
                //   quantity: quantity,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
