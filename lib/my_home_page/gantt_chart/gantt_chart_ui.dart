import 'package:flutter/material.dart';
import 'package:gantt_chart/gantt_chart.dart';

class GanttChartUi extends StatefulWidget {
  const GanttChartUi({super.key});

  @override
  State<GanttChartUi> createState() => _GanttChartUiState();
}

class _GanttChartUiState extends State<GanttChartUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
SingleChildScrollView(
          child: GanttChartView(
            dayWidth: 50,
            eventHeight: 150,
            startDate: DateTime(2025, 5, 1),
            maxDuration: const Duration(days: 30),
            showStickyArea: false,
            startOfTheWeek: WeekDay.monday, 
            weekEnds: const {WeekDay.sunday},
            holidayColor: Colors.white,
            
            events:[
              GanttAbsoluteEvent(
                startDate: DateTime(2025, 5, 1),
                endDate: DateTime(2025, 5, 7),
              ),
              GanttAbsoluteEvent(
                startDate: DateTime(2025, 5, 8),
                endDate: DateTime(2025, 5, 13),
              ),
              GanttAbsoluteEvent(
                startDate: DateTime(2025, 5, 14),
                endDate: DateTime(2025, 5, 18),
              ),
              GanttAbsoluteEvent(
                startDate: DateTime(2025, 5, 18),
                endDate: DateTime(2025, 5, 21),
              ),
              GanttAbsoluteEvent(
                startDate: DateTime(2025, 5, 22),
                endDate: DateTime(2025, 5, 30),
              ),
            ])
        )
    );
  }
}