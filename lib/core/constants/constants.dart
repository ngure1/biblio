class Urls {
  static String baseUrl = "https://www.googleapis.com/books/v1";
  static String search(String query) => "$baseUrl/volumes?q=$query";
}