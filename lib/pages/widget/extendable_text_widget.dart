import 'package:e_commerce/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtendableTextWidget extends StatefulWidget {
  final String text;
  const ExtendableTextWidget({super.key, required this.text});

  @override
  State<ExtendableTextWidget> createState() => _ExtendableTextWidgetState();
}

class _ExtendableTextWidgetState extends State<ExtendableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf + '...')
          : Column(
              children: [
                Text(
                  style: TextStyle(fontSize: Dimensions.font16, height: 1.5),
                  hiddenText ? (firstHalf + "...") : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        hiddenText ? "Show more" : "Show less",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
