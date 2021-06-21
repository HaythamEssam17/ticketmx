import 'package:equatable/equatable.dart';

class TicketEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class DateSelectEvent extends TicketEvents {
  final String date;

  DateSelectEvent(this.date);
}

class TimeSelectEvent extends TicketEvents {
  final String time;

  TimeSelectEvent(this.time);
}

class CategorySelectEvent extends TicketEvents {
  final String category;

  CategorySelectEvent(this.category);
}
