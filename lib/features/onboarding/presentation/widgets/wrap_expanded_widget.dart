import 'package:flutter/material.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/font_weight_helper.dart';

class InterestsWrapWidget extends StatefulWidget {
  final List<String> interests;
  final List<bool> selectedInterests ;
  const InterestsWrapWidget({super.key ,required this.interests , required this.selectedInterests});

  @override
  State<InterestsWrapWidget> createState() => _InterestsWrapWidgetState();
}

class _InterestsWrapWidgetState extends State<InterestsWrapWidget> {
  



  void _toggleInterest(int index) {
    setState(() {
     widget. selectedInterests[index] = !widget.selectedInterests[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        spacing: 5,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(widget.interests.length, (index) {
          return OutlinedButton(
            onPressed: () => _toggleInterest(index),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey),
              backgroundColor: widget.selectedInterests[index]
                  ? AppColors.buttonColor
                  : AppColors.backgroundLightGray,
              foregroundColor:
                  widget.selectedInterests[index] ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              '${widget.interests[index]} +',
              style: AppFonts.semiBold,
            ),
          );
        }),
      ),
    );
  }
}
