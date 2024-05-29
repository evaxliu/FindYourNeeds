
// class represents a location with various attributes.
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
  final String type;

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
    required this.type,
  });

  // creates a location instance from a JSON map.
  factory Location.fromJson(Map<String, dynamic> json) {
    String locationType;
    if (json['type'] == 'Restroom') {
      locationType = 'Restroom';
    } else if (json['type'] == 'General Hygiene') {
      locationType = 'General Hygiene';
    } else if (json['type'] == 'Library') {
      locationType = 'Library';
    } else if (json['type'] == 'Food Bank') {
      locationType = 'Food Bank';
    } else {
      locationType = 'Other';
    }
    // returns a new Location instance with the values from the JSON map.
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
      type: locationType,
    );
  }
}
