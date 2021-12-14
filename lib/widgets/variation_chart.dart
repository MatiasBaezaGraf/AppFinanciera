import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VariationChart extends StatefulWidget {

  final List<VariationData> formattedData;

  const VariationChart({
    Key? key, 
    required this.formattedData
  }) : super(key: key);

  @override
  _VariationChartState createState() => _VariationChartState();
}

class _VariationChartState extends State<VariationChart> {

  late List<VariationData> _chartData;

  @override
  void initState() {
    _chartData = widget.formattedData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      _chartData = widget.formattedData;
    });

    return Container(
      child: SfCartesianChart(
        backgroundColor: Colors.black,
        enableAxisAnimation: false,
        trackballBehavior: TrackballBehavior(
          enable: true,
          shouldAlwaysShow: true,
          tooltipSettings: InteractiveTooltip(
            borderWidth: 2,
            borderColor: Colors.grey,
            color: Colors.white,
            format: 'point.x : point.y%'
          )
        ),
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
          enablePinching: true,
          enableDoubleTapZooming: true,
          zoomMode: ZoomMode.xy,
          maximumZoomLevel: 0.2
        ),
        primaryXAxis: CategoryAxis(
          labelRotation: 90,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[200]
          ),
          axisLine: AxisLine(
            width: 2,
            color: Colors.grey[200]
          ),
          majorGridLines: MajorGridLines(width: 1),
        ),
        primaryYAxis: NumericAxis(
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[200]
          ),
          axisLine: AxisLine(
            width: 2,
            color: Colors.grey[200]
          ),
          title: AxisTitle( text: 'Variación (porcentaje)', textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          majorGridLines: MajorGridLines(width: 1),
        ), 
        series: <ChartSeries>[
        LineSeries<VariationData, String>( 
          color: Colors.pink,
          dataSource: _chartData,
          xValueMapper: (VariationData data, _) => data.date,
          yValueMapper: (VariationData data, _) => data.value
        )
      ],)
    );
  }
}

class VariationData {

  final String date;
  final double value;

  VariationData(this.date, this.value);

}

