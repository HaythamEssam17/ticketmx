import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_events.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_states.dart';

class TicketBloc extends Bloc<TicketEvents, TicketStates> {
  TicketBloc(TicketStates initialState) : super(initialState);

  String selectedDate = '';
  String selectedTime = '';
  String selectedCategory = '';

  String get getDate => selectedDate;
  String get getTime => selectedTime;
  String get getCategory => selectedCategory;

  @override
  Stream<TicketStates> mapEventToState(TicketEvents event) async* {
    yield* _dateSelectEvent(event);
    yield* _timeSelectEvent(event);
    yield* _categorySelectEvent(event);
  }

  Stream<TicketStates> _dateSelectEvent(TicketEvents event) async* {
    if (event is DateSelectEvent) {
      selectedDate = event.date;
      yield DateSuccessSelectedState();
    }
  }

  Stream<TicketStates> _timeSelectEvent(TicketEvents event) async* {
    if (event is TimeSelectEvent) {
      selectedTime = event.time;
      yield TimeSuccessSelectedState();
    }
  }

  Stream<TicketStates> _categorySelectEvent(TicketEvents event) async* {
    if (event is CategorySelectEvent) {
      selectedCategory = event.category;
      yield CategorySuccessSelectedState();
    }
  }
}
