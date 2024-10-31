class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api";

  static String userEndpoint(String endpoint) => "$baseUrl/user/$endpoint";
  static String driverEndpoint(String endpoint) => "$baseUrl/driver/$endpoint";
}
