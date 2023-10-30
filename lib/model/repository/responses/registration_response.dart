class RegistrationResponse {
  final String message;

  RegistrationResponse({
    required this.message,
  });

  RegistrationResponse copyWith({
    String? message,
  }) =>
      RegistrationResponse(
        message: message ?? this.message,
      );
}
