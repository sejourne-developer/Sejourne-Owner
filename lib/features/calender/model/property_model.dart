class PropertyModel {
  final String propertyName;
  final List<BookingsModel> bookings;

  PropertyModel(
      {required this.propertyName,
      required this.bookings});

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        propertyName: json["propertyName"],
        bookings: json["bookings"],
      );
}
class BookingsModel {
  final String userName;
  final String userPic;
  final String guests;
  final int nights;
  final int day;

  BookingsModel(
      {required this.userName,
      required this.userPic,
      required this.guests,
      required this.nights,
      required this.day});

  factory BookingsModel.fromJson(Map<String, dynamic> json) => BookingsModel(
        userName: json["userName"],
        userPic: json["userPic"],
        guests: json["guests"],
        nights: json["nights"],
        day: json["day"],
      );
}
