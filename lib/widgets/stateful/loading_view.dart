
import 'package:flight_reminder/theme_constants/colours.dart';
import 'package:flight_reminder/theme_constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingView extends StatefulWidget {
  final bool show;
  final bool isWhiteBg;

  const LoadingView({required this.show, this.isWhiteBg = false, Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Visibility(
        visible: widget.show,
        child: Stack(
          alignment: Alignment.center,
          children: [
                    Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: !widget.isWhiteBg ? Colors.black.withAlpha(90) : Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
               Padding(
                padding: EdgeInsets.only(left: 125, right: 125,),
                child: LoadingIndicator(
                  indicatorType: Indicator.orbit,
                  colors: [kAccent],
                ),
              ),
              Text('Loading...', style: kFlightetails,),
              SizedBox(height: 125,)
            ],
          ),
    
        ]),
      ),
    );
  }
}
