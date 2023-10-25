
class LoginResponse {
  final String success;

  LoginResponse({
    required this.success,
  });

  LoginResponse copyWith({
    String? success,
  }) =>
      LoginResponse(
        success: success ?? this.success,
      );
}
