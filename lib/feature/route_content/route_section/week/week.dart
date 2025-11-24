import 'package:flutter/material.dart';

class DaySchedule {
  final String date;
  final String day;
  final int temp;
  final List<String> events;

  DaySchedule({
    required this.date,
    required this.day,
    required this.temp,
    required this.events,
  });
}

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({Key? key}) : super(key: key);

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  late List<DaySchedule> scheduleData;

  @override
  void initState() {
    super.initState();

    scheduleData = [
      DaySchedule(
        date: 'Jan 11',
        day: 'Sun (30)',
        temp: 30,
        events: [
          'Club~P.E.Deep Sea Angling',
          'Erica Girls Primary -SSD',
          'Charlo Primary -SSD',
          'Andrew Rabie Tuck Shop',
          'Laersk.Morewag -SSD',
          'Kabega Primary Tuck Shop-SSD',
          'Club~Westview Sport Club-SSD',
          'Club~Wedgewood Catering-SSD',
        ],
      ),
      DaySchedule(
        date: 'Jan 12',
        day: 'Mon (32)',
        temp: 32,
        events: [
          'Club~P.E.Deep Sea Angling',
          'Erica Girls Primary -SSD',
          'Charlo Primary -SSD',
          'Andrew Rabie Tuck Shop',
          'Laersk.Morewag -SSD',
          'Kabega Primary Tuck Shop-SSD',
          'Club~Westview Sport Club-SSD',
          'Club~Wedgewood Catering-SSD',
        ],
      ),
      DaySchedule(
        date: 'Jan 13',
        day: 'Tue (35)',
        temp: 35,
        events: [
          'Club~P.E.Deep Sea Angling',
          'Erica Girls Primary -SSD',
          'Charlo Primary -SSD',
          'Andrew Rabie Tuck Shop',
          'Laersk.Morewag -SSD',
          'Kabega Primary Tuck Shop-SSD',
          'Club~Westview Sport Club-SSD',
          'Club~Wedgewood Catering-SSD',
        ],
      ),
      DaySchedule(
        date: 'Jan 14',
        day: 'Wed (28)',
        temp: 28,
        events: [
          'Club~P.E.Deep Sea Angling',
          'Erica Girls Primary -SSD',
          'Charlo Primary -SSD',
          'Andrew Rabie Tuck Shop',
          'Laersk.Morewag -SSD',
          'Kabega Primary Tuck Shop-SSD',
          'Club~Westview Sport Club-SSD',
          'Club~Wedgewood Catering-SSD',
        ],
      ),
      DaySchedule(
        date: 'Jan 15',
        day: 'Thu (27)',
        temp: 27,
        events: [
          'Club~P.E.Deep Sea Angling',
          'Erica Girls Primary -SSD',
          'Charlo Primary -SSD',
          'Andrew Rabie Tuck Shop',
          'Laersk.Morewag -SSD',
          'Kabega Primary Tuck Shop-SSD',
          'Club~Westview Sport Club-SSD',
          'Club~Wedgewood Catering-SSD',
        ],
      ),
      DaySchedule(
        date: 'Jan 16',
        day: 'Fri (30)',
        temp: 30,
        events: [
          'Club~P.E.Deep Sea Angling',
          'Erica Girls Primary -SSD',
          'Charlo Primary -SSD',
          'Andrew Rabie Tuck Shop',
          'Laersk.Morewag -SSD',
          'Kabega Primary Tuck Shop-SSD',
          'Club~Westview Sport Club-SSD',
          'Club~Wedgewood Catering-SSD',
        ],
      ),
      DaySchedule(
        date: 'Jan 17',
        day: 'Sat',
        temp: 0,
        events: [
          'Club~P.E.Deep Sea Angling',
          'Erica Girls Primary -SSD',
          'Charlo Primary -SSD',
          'Andrew Rabie Tuck Shop',
          'Laersk.Morewag -SSD',
          'Kabega Primary Tuck Shop-SSD',
          'Club~Westview Sport Club-SSD',
          'Club~Wedgewood Catering-SSD',
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        children: [
          /// 🔵 WEEK HEADER
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF1a2332),
            ),
            margin: EdgeInsets.only(left: 4, right: 4, top: 17),
            width: double.infinity,
            padding: const EdgeInsets.all(13),
            child: const Text(
              'January 11-17, 2025',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// 🔵 SCROLLABLE GRID FOR DAYS + EVENTS
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: scheduleData.map((day) {
                    return DayColumn(
                      daySchedule: day,
                      isHighlighted: day.date == 'Jan 13',
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DayColumn extends StatelessWidget {
  final DaySchedule daySchedule;
  final bool isHighlighted;

  const DayColumn({
    Key? key,
    required this.daySchedule,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      // margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey.shade300),
          ),
      child: Column(
        children: [
          /// DATE BOX
          Container(
            width: 200,
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            margin: EdgeInsets.fromLTRB(5, 12, 5, 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isHighlighted
                  ? const Color(0xFF1a2332)
                  : Colors.grey.shade200,
            ),
            child: Text(
              '${daySchedule.date}, ${daySchedule.day}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isHighlighted ? Colors.white : Colors.black,
              ),
            ),
          ),

          /// EVENTS
          ...daySchedule.events.map((event) {
            return EventCard(
              event: event,
              isHighlighted: isHighlighted && event.contains('Laersk.Morewag'),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String event;
  final bool isHighlighted;

  const EventCard({
    Key? key,
    required this.event,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFF1a2332) : Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Text(
        event,
        style: TextStyle(
          fontSize: 13.5,
          height: 1.4,
          color: isHighlighted ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
