import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _min = 0.0;
  double _max = 50000.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    max: 50000,
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
                  enableIntervalSelection: true,
                  min: 0.0,
                  max: 50000.0,
                  interval: 1000,
                  showTicks: true,
                  showLabels: true,
                  values: SfRangeValues(_min, _max),
                  onChanged: (v) {
                    print(v);
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
