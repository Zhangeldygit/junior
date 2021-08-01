
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String addressStreet;
  final String addressSuite;
  final String phone;
  final String website;
  final String companyName;
  final String companyCatchPhrase;
  final String companyBs;
  final double lat;
  final double lng;

  User({
    this.addressStreet,
    this.addressSuite,
    this.companyName,
    this.companyCatchPhrase,
    this.companyBs,
    this.lat,
    this.lng,
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      addressStreet: json['address']['street'] as String,
      lat: double.parse(json['address']['geo']['lat'] as String),
      lng: double.parse(json['address']['geo']['lng'] as String),
      addressSuite: json['address']['suite'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
      companyName: json['company']['name'] as String,
      companyCatchPhrase: json['company']['catchPhrase'] as String,
      companyBs: json['company']['bs'] as String,
    );
  }
}