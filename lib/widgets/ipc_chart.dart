import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultChart extends StatefulWidget {

  final List<IpcData> formattedData;

  const ResultChart({
    Key? key, 
    required this.formattedData,
  }) : super(key: key);

  

  @override
  _ResultChartState createState(){
    return _ResultChartState();
  }
}

class _ResultChartState extends State<ResultChart> {

  late List<IpcData> _chartData;

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
            color: Colors.grey[400],
            format: 'point.x : point.y'
          )
        ),
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
          enablePinching: true,
          enableDoubleTapZooming: true,
          zoomMode: ZoomMode.xy,
        ),
        primaryXAxis: CategoryAxis(
          labelRotation: 90,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[400]
          ),
          axisLine: AxisLine(
            width: 2,
            color: Colors.grey
          ),
          majorGridLines: MajorGridLines(width: 1),
        ),
        primaryYAxis: NumericAxis(
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[400]
          ),
          axisLine: AxisLine(
            width: 2,
            color: Colors.grey
          ),
          title: AxisTitle( text: 'IPC', textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          majorGridLines: MajorGridLines(width: 1),
        ), 
        series: <ChartSeries>[
        LineSeries<IpcData, String>( 
          color: Colors.blue,
          dataSource: _chartData,
          xValueMapper: (IpcData data, _) => data.date,
          yValueMapper: (IpcData data, _) => data.value
        )
      ],)
    );
  }
}

class IpcData {

  final String date;
  final double value;

  IpcData(this.date, this.value);

}

