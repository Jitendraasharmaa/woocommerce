import 'package:flutter/material.dart';
import 'package:woocomerece/utils/dimensions.dart';
import 'package:woocomerece/widgets/custom_text.dart';
import 'package:woocomerece/widgets/small_text.dart';
import '../../utils/colors.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  final textHeight = Dimensions.screenHeight / 5;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(title: firstHalf)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  title:hiddenText ? "$firstHalf.." : (firstHalf + secondHalf),
                  size: 15,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       BigText(
                        title:  hiddenText?"Show More":"Hide",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                         hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
