// coverage:ignore-file

abstract class Failure {
  const Failure();

  String get message;

  @override
  bool operator ==(Object other) => identical(this, other) || (other is Failure && runtimeType == other.runtimeType && message == other.message);

  @override
  int get hashCode => message.hashCode;
}

class NetworkFailure extends Failure {
  const NetworkFailure();

  @override
  String get message => "Sin conexion a internet";
}

class ServerFailure extends Failure {
  final String _message;

  const ServerFailure([this._message = "Error en el servidor"]);

  @override
  String get message => _message;
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure();

  @override
  String get message => "Error inesperado";
}

class InvalidArgOrDataFailure extends Failure {
  final String _message;

  const InvalidArgOrDataFailure([this._message = "Algunos campos son invalidos"]);

  @override
  String get message => _message;
}

class CacheFailure extends Failure {
  final String _message;

  const CacheFailure([this._message = "Error de cache"]);

  @override
  String get message => _message;
}
