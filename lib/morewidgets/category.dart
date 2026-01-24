import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryHome extends StatefulWidget {
  const CategoryHome({super.key});

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  final List<String> _category = [
    'All',
    'Recommended',
    'Thriller',
    'Romance',
    'Comedy',
    'Horror',
    'Sci-Fi',
    'Documentary',
    'Action',
    'Drama',
    'Animation',
    'Fantasy',
    'Mystery',
    'Adventure',
    'Musical',
  ];

  int _selectedCategory = 0;

  void _onTapCategory(int index) {
    setState(() {
      _selectedCategory = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _category.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 5),
          child: InkWell(
              onTap: () => _onTapCategory(index),
              child: _selectedCategory == index
                  ? CategoryItem(
                      category: _category[index],
                      backgroundColor: Color.fromARGB(255, 245, 179, 1),
                      fontColor: Colors.white,
                    )
                  : CategoryItem(
                      category: _category[index],
                      backgroundColor: Colors.transparent,
                      fontColor: Colors.black,
                    )),
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.backgroundColor,
    required this.fontColor,
  });

  final String category;
  final Color backgroundColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          category,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }
}