import 'package:chic_lyne/core/theming/styles.dart';
import 'package:chic_lyne/features/home/ui/widgets/text_category_and_top_selling_and_new_in.dart';
import 'package:flutter/material.dart';

class NewInSection extends StatelessWidget {
  const NewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCategoryAndTopSellingAndNewIn(
          text: 'New In',
          style: TextStyles.font20purpleBold,

          textButton: 'See All',
          styleTextButton: TextStyles.font15BlueBold,
        ),
        _buildNewInItems(),
      ],
    );
  }

  Widget _buildNewInItems() {
    List<Map<String, dynamic>> newInItems = [
      {
        'name': 'Men\'s Harrington Jacket',
        'price': '\$148.00',
        'image': 'assets/man/men-shoes.jpg',
      },
      {
        'name': 'Men\'s Coaches Jacket',
        'price': '\$66.97',
        'image': 'assets/man/men-shoes.jpg',
      },
      {'name': 'Max', 'price': '\$55.00', 'image': 'assets/man/men-shoes.jpg'},
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final itemWidth = constraints.maxWidth / 2;
        final itemHeight = screenWidth * 0.6;
        final fontSize = screenWidth * 0.03;
        return SizedBox(
          height: itemHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newInItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: itemWidth,
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        newInItems[index]['image'],
                        fit: BoxFit.fill,
                        height: itemHeight * 0.6,
                      ),
                      Spacer(flex: 2),
                      Text(
                        newInItems[index]['name'],
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        newInItems[index]['price'],
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
