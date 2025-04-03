import 'package:flutter/material.dart';

class ProductImagesComponent extends StatefulWidget {
  final List<String> images;
  final double height;
  final double padding;

  const ProductImagesComponent({
    super.key,
    required this.images,
    required this.height,
    required this.padding,
  });

  @override
  State<ProductImagesComponent> createState() => _ProductImagesComponentState();
}

class _ProductImagesComponentState extends State<ProductImagesComponent> {
  late PageController _pageController;
  int _currentPage = 0;
  List<String> _validImages = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      int page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });

    // فلترة الصور الصالحة
    _validateImages();
  }

  // التحقق من صحة الصور
  void _validateImages() async {
    setState(() {
      _isLoading = true;
    });

    // استخدام الصور المدخلة فقط إذا كانت غير فارغة
    if (widget.images.isNotEmpty) {
      _validImages = widget.images;
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return SizedBox(
        height: widget.height,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    // إذا لم تكن هناك صور صالحة، اعرض عنصر خالي مع رسالة
    if (_validImages.isEmpty) {
      return SizedBox(
        height: widget.height,
        child: _buildEmptyImagePlaceholder(),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _validImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.padding),
                child: _buildProductImage(_validImages[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // عرض مؤشر الصفحات فقط إذا كان هناك أكثر من صورة واحدة
        _validImages.length > 1
            ? _buildPageIndicator(_validImages.length)
            : const SizedBox(),
      ],
    );
  }

  // استخدام عنصر بديل محلي بدلاً من صور الإنترنت
  Widget _buildEmptyImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            size: 60,
            color: Colors.grey[500],
          ),
          const SizedBox(height: 10),
          Text(
            "No images available",
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        height: 350,
        width: 150,
        imageUrl,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[100],
            child: Center(
              child: CircularProgressIndicator(
                value:
                    loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Center(
              child: Icon(
                Icons.broken_image_outlined,
                size: 50,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageIndicator(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 5),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: _currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
            color:
                _currentPage == index
                    ? Colors.deepPurple[400]
                    : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
