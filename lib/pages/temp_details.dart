import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import "dart:math" as math;

class temp_details extends StatefulWidget {
  const temp_details({super.key});

  @override
  State<temp_details> createState() => _ChartsState();
}

class _ChartsState extends State<temp_details> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  late Timer timer;
  @override
  void initState() {
    chartData = getChartData();
    timer = Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("temp_details")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              radialGauge(),
              cartesianChart(),
            ],
          ),
        ),
      ),
    );
  }

  double value = 90.0;
  Widget radialGauge() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 150,
          interval: 10,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 50,
              color: Colors.green,
            ),
            GaugeRange(
              startValue: 50,
              endValue: 100,
              color: Colors.orange,
            ),
            GaugeRange(
              startValue: 100,
              endValue: 150,
              color: Colors.red,
            )
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: value,
              enableAnimation: true,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                "$value",
                style: TextStyle(
                  color: value <= 50 && value > 0
                      ? Colors.green
                      : value < 100 && value > 50
                          ? Colors.orange
                          : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              positionFactor: 0.5,
              angle: 90,
            )
          ],
        )
      ],
    );
  }

  Widget cartesianChart() {
    return SfCartesianChart(
        series: <LineSeries<LiveData, int>>[
          LineSeries<LiveData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: const Color.fromRGBO(192, 108, 132, 1),
            xValueMapper: (LiveData sales, _) => sales.time,
            yValueMapper: (LiveData sales, _) => sales.speed,
          )
        ],
        primaryXAxis: NumericAxis(
            majorGridLines: const MajorGridLines(width: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            interval: 3,
            title: AxisTitle(text: 'Time (seconds)')),
        primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0),
            title: AxisTitle(text: 'Tempreture')));
  }

  int time = 19;
  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 47),
      LiveData(2, 43),
      LiveData(3, 49),
      LiveData(4, 54),
      LiveData(5, 41),
      LiveData(6, 58),
      LiveData(7, 51),
      LiveData(8, 98),
      LiveData(9, 41),
      LiveData(10, 53),
      LiveData(11, 72),
      LiveData(12, 86),
      LiveData(13, 52),
      LiveData(14, 94),
      LiveData(15, 92),
      LiveData(16, 86),
      LiveData(17, 72),
      LiveData(18, 94)
    ];
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
