abstract class NetworkResult<T> {
  T status;
  dynamic result;

  NetworkResult({required this.status, this.result});

   String getMessage();
}