
class Failure {
  final int code;
  final String message;

  Failure(this.code, this.message);

  @override
  List<Object> get props => [code, message];
}
