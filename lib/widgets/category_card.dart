import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_svg/svg.dart';
=======
>>>>>>> hans-1

class CategoryCard extends StatelessWidget {
  final String images;
  final String title;
  final Function()? press;
<<<<<<< HEAD
   CategoryCard({
     Key? key,
    required this.images,
    required this.title,
    this.press,
  }) : super(key: key) {
   
  }
=======
  const CategoryCard({
    Key? key,
    required this.images,
    required this.title,
    this.press,
  }) : super(key: key);
>>>>>>> hans-1

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
<<<<<<< HEAD
          color: Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
=======
          color: const Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
>>>>>>> hans-1
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xFFE6E6E6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
<<<<<<< HEAD
                  Spacer(),
                  Image.asset(images),
                  Spacer(),
                 
=======
                  const Spacer(),
                  Image.asset(images),
                  const Spacer(),
>>>>>>> hans-1
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
<<<<<<< HEAD

=======
>>>>>>> hans-1
