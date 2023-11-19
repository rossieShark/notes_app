abstract class CurrentDateEvent {}

class CanheCurrentDateEvent extends CurrentDateEvent {
  final int index;

  CanheCurrentDateEvent(this.index);
}
