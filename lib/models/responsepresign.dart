class ResponsePresign {
  int? expiration;
  String? method;
  SignedHeader? signedHeader;
  String? url;

  ResponsePresign({
    this.expiration,
    this.method,
    this.signedHeader,
    this.url,
  });
}

class SignedHeader {
  List<String>? host;

  SignedHeader({
    this.host,
  });
}
