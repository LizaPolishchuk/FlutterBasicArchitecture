abstract class NavEvent {
  final List args;

  NavEvent([this.args = const []]);
}

class NavPop extends NavEvent {
  @override
  List<Object> get props => null;
}

class NavToExampleEvent extends NavEvent {
  NavToExampleEvent([args]) : super(args);

  @override
  List<Object> get props => args;
}
