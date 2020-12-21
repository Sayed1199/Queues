import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class SimpleLineChart extends StatefulWidget {

  List<String> arrivalList;
  List<String> departureList;
  List<int> botNofCDataList;
  List<int> botArrivalTimeDataList;
  SimpleLineChart({this.arrivalList,this.botNofCDataList,this.botArrivalTimeDataList,this.departureList});

  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends State<SimpleLineChart> {

  List<BotData> botDataList =[];

   List<ArrivalData> arrivalChartData;
  List<DepartureData> departureChartData;



  List<ArrivalData> convertArrivalData(List<String>tempList){
    List<ArrivalData>newList =[];
    for(int i=0;i<tempList.length;i++){
      newList.add(ArrivalData(30, tempList[i]));
    }
    return newList;

  }

  List<DepartureData> convertDepartureData(List<String>tempList){
    List<DepartureData>newList =[];
    for(int i=0;i<tempList.length;i++){
      newList.add(DepartureData(30, tempList[i]));
    }
    return newList;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     arrivalChartData = convertArrivalData(widget.arrivalList);
     departureChartData = convertDepartureData(widget.departureList);

     for(int i=0;i<widget.botArrivalTimeDataList.length;i++){

       botDataList.add(BotData(widget.botNofCDataList[i], widget.botArrivalTimeDataList[i]));
       print('Data now: nof: ${widget.botNofCDataList[i]} and time: ${widget.botArrivalTimeDataList[i]}');

     }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(
          children: [

            //////////////////////////////////

            Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 25.0),
              child: SfCartesianChart(

                  primaryXAxis: CategoryAxis(
                    // Axis labels will be placed on the ticks
                      labelPlacement: LabelPlacement.onTicks,
                    title: AxisTitle(text:'Arrivals')
                  ),

                primaryYAxis: CategoryAxis(isVisible: false,title: AxisTitle(text: 'Customers\' Arrivals',),labelRotation: 90),


                tooltipBehavior: TooltipBehavior(
                    enable: true,
                    // Formatting the tooltip text
                    format: 'Customer point.y',
                  color: Colors.blue,
                ),
                  trackballBehavior: TrackballBehavior(
                    tooltipAlignment: ChartAlignment.near,
                    tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                    enable: true,
                    tooltipSettings: InteractiveTooltip(
                        format: 'point.x : point.y%',
                        enable: true,
                        color: Colors.blue
                    ),
                  ),
                  zoomPanBehavior: ZoomPanBehavior(
                      enableDoubleTapZooming: true,
                      enablePinching: true,
                      enableSelectionZooming: true,
                      selectionRectBorderColor: Colors.red,
                      selectionRectBorderWidth: 1,
                      selectionRectColor: Colors.grey,
                  ),
                legend: Legend(isVisible: false),
                title: ChartTitle(text: 'Customers\' Arrivals',textStyle: TextStyle(color: Colors.teal)),
                enableAxisAnimation: true,
                  series: <ChartSeries>[
                    // Renders column chart

                    ColumnSeries<ArrivalData, String>(
                      name: 'Customers\' Arrivals',
                        dataSource: arrivalChartData,
                      xValueMapper: (ArrivalData obj, _) => obj.xArrivalValue,
                      yValueMapper: (ArrivalData obj, _) => obj.yArrivalValue,

                      enableTooltip:  true,
                        dataLabelSettings: DataLabelSettings(isVisible: false,useSeriesColor: true),
                        width: 0.05,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),

                      markerSettings: MarkerSettings(isVisible: true,color: Colors.red,borderColor: Colors.pink),



                    )
                  ]

              ),
            ),



///////////////////////////////////////////////////////

    SizedBox(height: 5.0,),

            Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 25.0),
              child: SfCartesianChart(

                  primaryXAxis: CategoryAxis(
                    isInversed: false,
                    // Axis labels will be placed on the ticks
                      labelPlacement: LabelPlacement.onTicks,
                      title: AxisTitle(text:'Departures')
                  ),

                  primaryYAxis: CategoryAxis(isVisible: false,title: AxisTitle(text: 'Customers\' Departures',),labelRotation: 90,isInversed: true),


                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    // Formatting the tooltip text
                    format: 'Customer point.y',
                    color: Colors.blue,
                  ),
                  trackballBehavior: TrackballBehavior(
                    tooltipAlignment: ChartAlignment.near,
                    tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                    enable: true,
                    tooltipSettings: InteractiveTooltip(
                        format: 'point.x : point.y%',
                        enable: true,
                        color: Colors.blue
                    ),
                  ),
                  zoomPanBehavior: ZoomPanBehavior(
                    enableDoubleTapZooming: true,
                    enablePinching: true,
                    enableSelectionZooming: true,
                    selectionRectBorderColor: Colors.red,
                    selectionRectBorderWidth: 1,
                    selectionRectColor: Colors.grey,
                  ),
                  legend: Legend(isVisible: false),
                  title: ChartTitle(text: 'Customers\' Departures',textStyle: TextStyle(color: Colors.red)),
                  enableAxisAnimation: true,
                  series: <ChartSeries>[
                    // Renders column chart

                    ColumnSeries<DepartureData, String>(
                      name: 'Customers\' Departure',
                      dataSource: departureChartData,
                      xValueMapper: (DepartureData obj, _) => obj.xDepartureValue,
                      yValueMapper: (DepartureData obj, _) => obj.yDepartureValue,

                      enableTooltip:  true,
                      dataLabelSettings: DataLabelSettings(isVisible: false,useSeriesColor: true),
                      width: 0.05,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),

                      markerSettings: MarkerSettings(isVisible: true,color: Colors.red,borderColor: Colors.pink),



                    )
                  ]

              ),
            ),


            SizedBox(height: 10.0,),

            Container(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                child: SfCartesianChart(
                title: ChartTitle(text: 'Customers\' Cycle',textStyle: TextStyle(color: Colors.blue,fontSize: 20),backgroundColor: Colors.pink[100]),
                    primaryXAxis: CategoryAxis(
                      // Axis labels will be placed on the ticks
                        labelPlacement: LabelPlacement.onTicks,
                        title: AxisTitle(text:'Customers\'Arrival Time'),
                    ),

                   // primaryYAxis: CategoryAxis(isVisible: true,title: AxisTitle(text: 'n(t)',),labelRotation: 90),

                    primaryYAxis: NumericAxis(title: AxisTitle(text: 'n(t)')),




                    tooltipBehavior: TooltipBehavior(
                        enable: true,
                        // Formatting the tooltip text
                        format: 'Time: point.x\nCustomers: point.y',
                      elevation: 0,
                      color: Colors.blue,
                      borderColor: Colors.blue,

                    ),
                    trackballBehavior: TrackballBehavior(
                      tooltipAlignment: ChartAlignment.near,
                      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                      enable: true,
                      tooltipSettings: InteractiveTooltip(
                          format: 'point.x : point.y%',
                          enable: true,
                          color: Colors.blue,
                      ),
                    ),
                    zoomPanBehavior: ZoomPanBehavior(
                      enableDoubleTapZooming: true,
                      enablePinching: true,
                      enableSelectionZooming: true,
                      selectionRectBorderColor: Colors.red,
                      selectionRectBorderWidth: 1,
                      selectionRectColor: Colors.grey,
                    ),



                    series: <ChartSeries>[

                      // Renders step line chart
                      StepLineSeries<BotData, int>(
                        name: 'Deterministic Chart',

                          dataSource: botDataList,
                          xValueMapper: (BotData obj, _) => obj.time+1,
                          yValueMapper: (BotData obj, _) => obj.nof,

                        enableTooltip:  true,

                        dataLabelSettings: DataLabelSettings(isVisible: false,useSeriesColor: true),
                        markerSettings: MarkerSettings(isVisible: true,color: Colors.red,borderColor: Colors.pink),



                      )
                    ]
                )
            ),








          ],
        ),



    );
  }



}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
class SalesData2 {
  SalesData2(this.year, this.sales);
  final double year;
  final double sales;
}

class ArrivalData{

  ArrivalData(this.yArrivalValue,this.xArrivalValue);
  final String xArrivalValue;
  final double yArrivalValue;

}

class BotData{

  BotData(this.nof,this.time);
  final int nof;
  final int time;

}

class DepartureData{

  DepartureData(this.yDepartureValue,this.xDepartureValue);
  final String xDepartureValue;
  final double yDepartureValue;

}