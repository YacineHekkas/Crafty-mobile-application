import 'package:cp_project/core/global/global.dart';
import 'package:flutter/cupertino.dart';

class Step_progress extends StatefulWidget {
  final int currentStep;
  final int Steps;
  const Step_progress(
      {super.key, required this.currentStep, required this.Steps});

  @override
  State<Step_progress> createState() => _Step_progressState();
}

class _Step_progressState extends State<Step_progress> {
  double widthprogress = 0;
  @override
  void initState() {
    super.initState();
  }

  void _onsizewidget() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.size is Size) {
        Size size = context.size!;
        widthprogress = size.width / (widget.Steps - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('${(widget.currentStep + 1).toInt()}/ ${widget.Steps.toInt()}')
          ],
        ),
        Container(
          height: 4,
          width: 4,
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Stack(children: [
            AnimatedContainer(
              duration: Duration(microseconds: 300),
              decoration: BoxDecoration(
                color: AppConst.darkBlue,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            )
          ]),
          decoration: BoxDecoration(
            color: AppConst.gray,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        )
      ],
    );
  }
}
