class Location {
  final String address;
  final bool laundry;
  final bool portableToilet;
  final bool restrooms;
  final bool showers;
  final String agencyName;
  final String accessibleBy;
  final String name;
  final String population;
  final double latitude;
  final double longitude;

  Location({
    required this.address,
    required this.laundry,
    required this.portableToilet,
    required this.restrooms,
    required this.showers,
    required this.agencyName,
    required this.accessibleBy,
    required this.name,
    required this.population,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'],
      laundry: json['laundry'] == 'Yes',
      portableToilet: json['portableToilet'] == 'Yes',
      restrooms: json['restrooms'] == 'Yes',
      showers: json['showers'] == 'Yes',
      agencyName: json['group'],
      accessibleBy: json['accessibleBy'],
      name: json['name'],
      population: json['population'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
