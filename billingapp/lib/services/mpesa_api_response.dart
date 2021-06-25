class MpesaApiResponse<T> {
  final T data;
  final bool hasError;
  final List errorMessage; //can be string or List depending
  MpesaApiResponse(this.data, this.hasError, this.errorMessage);
}
