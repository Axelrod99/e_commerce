import 'package:e_commerce/dimensions.dart';
import 'package:e_commerce/pages/widget/icon_and_text_widget.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: Dimensions.font20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign:
                    TextAlign.start, // This line justifies the text to the left
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) {
                  return Icon(Icons.star, color: Colors.blue[300], size: 15);
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "4.5",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "5263",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "comments",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Add rounded corners
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: Colors.yellow.shade800,
              ),
              SizedBox(width: 10),
              IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: Colors.blue.shade200,
              ),
              SizedBox(width: 10),
              IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32mins",
                iconColor: Colors.brown.shade200,
              ),
            ],
          ),
        )
      ],
    );
  }
}
