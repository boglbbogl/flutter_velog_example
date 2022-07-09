import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:slider_controller/slider_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _min = 0.0;
  double _max = 50000.0;
  double _slider = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SliderController(
                  value: 20,
                  onChanged: (v) {
                    print(v);
                  }),
              Container(
                width: _slider,
                height: 30,
                color: Colors.red,
              ),
              SizedBox(
                height: 60,
                width: 10,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (noti) {
                    setState(() {
                      _slider =
                          noti.metrics.maxScrollExtent - (noti.metrics.pixels);
                    });
                    print(noti.metrics.pixels);
                    return false;
                  },
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ...List.generate(
                        10,
                        (index) => Container(
                          height: 60,
                          width: 1,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: _slider,
                height: 20,
                color: Colors.amber,
              ),
              GestureDetector(
                onHorizontalDragStart: (details) {
                  print("start ${details}");
                },
                onHorizontalDragUpdate: (details) {
                  setState(() {});
                  print("update ${details}");
                  print("update ${details.delta}");
                  print("update ${details.delta.dx}");
                },
                child: Container(
                  width: 300,
                  height: 10,
                  color: Colors.deepOrange.shade200,
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 8,
                  overlayColor: Colors.white.withOpacity(0.1),
                  thumbColor: Colors.white,
                  rangeThumbShape: RoundRangeSliderThumbShape(
                    enabledThumbRadius: 14,
                    elevation: 3,
                  ),
                ),
                child: RangeSlider(
                    min: 0.0,
                    max: 100000,
                    divisions: 100,
                    values: RangeValues(_min, _max),
                    onChanged: (v) {
                      setState(() {
                        _min = v.start;
                        _max = v.end;
                      });
                      print(v);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SfRangeSlider(
                  showDividers: true,
                  min: 0.0,
                  max: 100000.0,
                  values: SfRangeValues(_min, _max),
                  onChanged: (v) {
                    print(v);
                    print((v.start / v.end) * 100);
                    print((v.start - v.end));
                    setState(() {
                      _min = double.parse(v.start.toString());
                      _max = double.parse((v.end).toString());
                      // _min = 35000;
                      // _max = 35000;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
