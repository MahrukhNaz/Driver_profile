import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DriverEarningsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Earnings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Driver Name: John Doe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            EarningsCard(),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: BarChart.withSampleData(
                      seriesList: BarChart._createSampleData(),
                      animate: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This Week's Earnings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EarningsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Earnings Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            EarningDetailRow('Total Earnings', '₨5000'),
            EarningDetailRow('Rides Completed', '100'),
            EarningDetailRow('Average Earnings per Ride', '₨50'),
          ],
        ),
      ),
    );
  }
}

class EarningDetailRow extends StatelessWidget {
  final String label;
  final String value;

  EarningDetailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BarChart extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList;
  final bool animate;

  BarChart(this.seriesList, {required this.animate});

  factory BarChart.withSampleData({required List<charts.Series<OrdinalSales, String>> seriesList, required bool animate}) {
    return BarChart(
      seriesList,
      animate: animate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('Mon', 1000),
      OrdinalSales('Tue', 3000),
      OrdinalSales('Wed', 2000),
      OrdinalSales('Thu', 4500),
      OrdinalSales('Fri', 6000),
      OrdinalSales('Sat', 8000),
      OrdinalSales('Sun', 7000),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Earnings',
        domainFn: (OrdinalSales sales, _) => sales.category,
        measureFn: (OrdinalSales sales, _) => sales.value,
        data: data,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        labelAccessorFn: (OrdinalSales sales, _) => '₨${sales.value}',
      ),
    ];
  }
}

class OrdinalSales {
  final String category;
  final int value;

  OrdinalSales(this.category, this.value);
}
