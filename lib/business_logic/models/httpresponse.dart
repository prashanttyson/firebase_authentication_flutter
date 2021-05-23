class HTTPResponse<T>{
  bool isSuccessful;
  T data;
  String message;
  int responseCode;
  HTTPResponse(this.isSuccessful,this.data,{this.message,this.responseCode});

}