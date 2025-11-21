import 'package:flutter/material.dart';
import 'package:techstore/helper/color.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor().putih,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenwidth * 0.08,
              right: screenwidth * 0.08,
            ),
            child: Container(
              height: 400,
              width: screenwidth * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/imageOne.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 50),
          Text(
            'Belanja Gadget Mudah',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: AppColor().hitam,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Temukan ribuan teknologi terbaru',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: AppColor().abu,
              fontSize: 20,
            ),
            maxLines: 2,
          ),
          Text(
            'dengan harga terbaik',
            style: TextStyle(color: AppColor().abu, fontSize: 20),
          ),
          SizedBox(height: screenheight * 0.17),
        ],
      ),
    );
  }
}
