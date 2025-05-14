class DokumenResponse {
  final String status;
  final Map<String, String> result;

  DokumenResponse({
    required this.status,
    required this.result,
  });

  // Method untuk mengonversi JSON ke objek DokumenResponse
  factory DokumenResponse.fromJson(Map<String, dynamic> json) {
    return DokumenResponse(
      status: json['status'] ?? '',
      result: Map<String, String>.from(json['result'] ?? {}),
    );
  }

  // Method untuk mengonversi objek DokumenResponse ke format JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'result': result,
    };
  }
}
