import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_provider/consumer/themeSwitch.dart';
import 'package:toggle_provider/provider/counter_provider.dart';
import 'package:toggle_provider/provider/opacity_provider.dart';
import 'package:toggle_provider/provider/slider_provider.dart';
import 'package:toggle_provider/provider/toggle_provider.dart';

class TooglePage extends StatefulWidget {
  final String title;
  const TooglePage({super.key, required this.title});

  @override
  State<TooglePage> createState() => _TooglePageState();
}

class _TooglePageState extends State<TooglePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      countProvider.datetime();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    
    // final toggleProvider = Provider.of<ToggleProvider>(context);
    // final countProvider = Provider.of<CounterProvider>(context, listen: false);
    // final toggleProvider = Provider.of<ToggleProvider>(context, listen: false);
    // final sliderProvider = Provider.of<SliderProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.grey.shade700,
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('asset/image2.jpg', fit: BoxFit.fitHeight),
          ),

          ThemeSwitch(),

          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ---- 1st
                Consumer<CounterProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.noww.toString(),
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),

                // ----- 2nd
                Consumer<CounterProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.count.toString(),
                      style: TextStyle(fontSize: 50),
                    );
                  },
                ),

                // -------3
                Consumer<ToggleProvider>(
                  builder: (context, value, child) {
                    return SwitchListTile(
                      title: Text('Theme'),
                      activeThumbColor: Colors.black,
                      activeTrackColor: Colors.lightBlue,
                      value: value.isDark,
                      onChanged: (bool? newvalue) {
                        value.setTheme();
                      },
                    );
                  },
                ),

                SizedBox(height: 20),

                Consumer<SliderProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Slider(
                          value: value.value,
                          min: 1.0,
                          max: 100.0,
                          divisions: 100,

                          onChanged: (double newValue) {
                            value.setOpacitySlider(context, newValue);
                          },
                        ),
                        Text("Slider Value: ${value.value.toStringAsFixed(1)}"),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  value.increment();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  value.reset();
                },
                tooltip: 'Reset',
                child: Icon(Icons.restore),
              ),
            ],
          );
        },
      ),
    );
  }
}
