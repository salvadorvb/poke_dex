// coverage:ignore-file
abstract class PokedexException implements Exception {
  String get message;

  @override
  operator ==(other) {
    return other is PokedexException && message == other.message;
  }

  @override
  int get hashCode => message.hashCode;
}

abstract class ServerException implements PokedexException {}

class TimeoutServerException implements ServerException {
  final String msg;
  TimeoutServerException([this.msg = "Timeout en la conexion"]);

  @override
  String get message => msg;
}

class UnexpectedServerException implements ServerException {
  final String msg;
  UnexpectedServerException([this.msg = "Error inesperado..."]);

  @override
  String get message => msg;
}

class PokedexServerException implements ServerException {
  final String msg;
  PokedexServerException([this.msg = "Error inesperado..."]);

  @override
  String get message => msg;
}

class InvalidArgOrDataException implements PokedexException {
  final String msg;
  InvalidArgOrDataException([this.msg = "Error en los argumentos o datos"]);
  @override
  String get message => msg;
}

class CacheGetException implements PokedexException {
  final String msg;
  CacheGetException([this.msg = "Error al recuperar los datos internos"]);
  @override
  String get message => msg;
}

class CachePutException implements PokedexException {
  final String msg;
  CachePutException([this.msg = "Error al guardar datos"]);
  @override
  String get message => msg;
}
