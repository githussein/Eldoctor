import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.20),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatsCard('Total cases', '2.64 M', Colors.deepPurple),
                _buildStatsCard('Recovered', '1.88 M', Colors.green),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatsCard('Active cases', '620 K', Colors.red),
                _buildStatsCard('Deaths', '140 K', Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatsCard(String title, String number, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            Text(
              number,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
