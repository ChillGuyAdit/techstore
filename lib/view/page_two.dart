import 'package:flutter/material.dart';
import 'package:techstore/helper/color.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor().putih,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Container(
              width: screenWidth * 0.8,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/imageTwo.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 50),
          Text(
            'Pengiriman Cepat & Aman',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor().hitam,
              fontFamily: 'Roboto',
              fontSize: 25,
            ),
          ),
          SizedBox(height: 30),

          SizedBox(height: 100),
        ],
      ),
    );
  }
}
