class ResGoogleSignInModel {
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final String? id;
  final String? token;

  ResGoogleSignInModel(
      this.displayName, this.email, this.photoUrl, this.id, this.token);

  factory ResGoogleSignInModel.fromJson(Map<String, dynamic> json) {
    return ResGoogleSignInModel(
      json["displayName"],
      json["email"],
      json["photoUrl"],
      json["id"],
      json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "displayName" : displayName,
      "email" : email,
      "photoUrl" : photoUrl,
      "id" : id,
      "token" : token,
    };
  }
}
