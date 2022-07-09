import 'package:flutter/material.dart';
import 'package:flutter_velog_example/state/slider_provider.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderProvider(),
      child: Consumer<SliderProvider>(
        builder: (BuildContext context, SliderProvider value, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: const Text('Range Slider'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RangeSlider(
                    max: 100,
                    values: value.rangeValues,
                    onChanged: (v) => value.changedRangeValues(rangeValues: v),
                  ),
                  RangeSlider(
                    max: 100,
                    divisions: 10,
                    values: value.rangeValues,
                    onChanged: (v) => value.changedRangeValues(rangeValues: v),
                  ),
                  RangeSlider(
                    max: 100,
                    divisions: 10,
                    labels: RangeLabels(value.rangeValues.start.toString(),
                        value.rangeValues.end.toString()),
                    values: value.rangeValues,
                    onChanged: (v) => value.changedRangeValues(rangeValues: v),
                  ),
                  RangeSlider(
                    max: 100,
                    divisions: 10,
                    inactiveColor: Colors.deepOrange.shade100,
                    activeColor: Colors.deepOrange,
                    labels: RangeLabels(value.rangeValues.start.toString(),
                        value.rangeValues.end.toString()),
                    values: value.rangeValues,
                    onChanged: (v) => value.changedRangeValues(rangeValues: v),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      inactiveTrackColor: Colors.deepOrange.shade100,
                      activeTrackColor: Colors.deepOrange,
                    ),
                    child: RangeSlider(
                      max: 100,
                      divisions: 10,
                      labels: RangeLabels(value.rangeValues.start.toString(),
                          value.rangeValues.end.toString()),
                      values: value.rangeValues,
                      onChanged: (v) =>
                          value.changedRangeValues(rangeValues: v),
                    ),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      inactiveTrackColor: Colors.green.shade100,
                      activeTrackColor: Colors.green,
                      valueIndicatorColor: Colors.green,
                      thumbColor: Colors.white,
                      trackHeight: 10,
                      rangeThumbShape: const RoundRangeSliderThumbShape(
                        enabledThumbRadius: 14,
                        elevation: 3,
                      ),
                    ),
                    child: RangeSlider(
                      max: 100,
                      labels: RangeLabels(value.rangeValues.start.toString(),
                          value.rangeValues.end.toString()),
                      values: value.rangeValues,
                      onChanged: (v) =>
                          value.changedRangeValues(rangeValues: v),
                    ),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbSelector:
                          CustomRangeSliderSelector._customRangeThumbSelector,
                      inactiveTrackColor: Colors.deepPurple.shade100,
                      activeTrackColor: Colors.purple,
                      valueIndicatorColor: Colors.deepPurple,
                      thumbColor: Colors.purple,
                      trackHeight: 10,
                      rangeThumbShape: const RoundRangeSliderThumbShape(
                        enabledThumbRadius: 14,
                      ),
                    ),
                    child: RangeSlider(
                      max: 100,
                      labels: RangeLabels(value.rangeValues.start.toString(),
                          value.rangeValues.end.toString()),
                      values: value.rangeValues,
                      onChanged: (v) =>
                          value.changedRangeValues(rangeValues: v),
                    ),
                  ),
                  // SliderTheme(
                  //   data: SliderThemeData(
                  //     trackHeight: 8,
                  //     overlayColor: Colors.white.withOpacity(0.1),
                  //     thumbColor: Colors.white,
                  //     rangeThumbShape: const RoundRangeSliderThumbShape(
                  //       enabledThumbRadius: 14,
                  //       elevation: 3,
                  //     ),
                  //   ),
                  //   child: RangeSlider(
                  //       min: 0.0,
                  //       max: 100000,
                  //       divisions: 100,
                  //       values: RangeValues(1, 2),
                  //       onChanged: (v) {}),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomRangeSliderSelector {
  static final RangeThumbSelector _customRangeThumbSelector = (
    TextDirection textDirection,
    RangeValues values,
    double tapValue,
    Size thumbSize,
    Size trackSize,
    double dx,
  ) {
    final double start = (tapValue - values.start).abs();
    final double end = (tapValue - values.end).abs();
    if (start < end) {
      return Thumb.start;
    } else if (start > end) {
      return Thumb.end;
    } else if (start == end) {
      if (tapValue < values.start) {
        return Thumb.start;
      } else {
        return Thumb.end;
      }
    } else {
      return Thumb.start;
    }
  };
}
