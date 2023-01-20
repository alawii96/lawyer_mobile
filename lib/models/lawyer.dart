class Lawyer {
  final String id;
  final String name;
  final String bio;
  final String category;
  final String profileImageURL;
  // final String sat_start;
  // final String sat_end;
  // final String sun_start;
  // final String sun_end;
  // final String mon_start;
  // final String mon_end;
  // final String tue_start;
  // final String tue_end;
  // final String wed_start;
  // final String wed_end;
  // final String thu_start;
  // final String thu_end;
  // final String fri_start;
  // final String fri_end;
  final String rating;

  Lawyer({
    this.rating = "0",
    required this.id,
    required this.name,
    required this.bio,
    required this.category,
    // this.sat_start = "8",
    // this.sat_end = "16",
    // this.sun_start = "8",
    // this.sun_end = "16",
    // this.mon_start = "8",
    // this.mon_end = "16",
    // this.tue_start = "8",
    // this.tue_end = "16",
    // this.wed_start = "8",
    // this.wed_end = "16",
    // this.thu_start = "8",
    // this.thu_end = "16",
    // this.fri_start = "8",
    // this.fri_end = "16",
    this.profileImageURL = "null",
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bio': bio,
      'rating': rating,
      'profileImageURL': profileImageURL,
      'category': category
    };
  }

  Lawyer.fromMap(Map<String, dynamic> map, this.id)
      : name = map["name"],
        bio = map["bio"],
        category = map["category"],
        rating = map["rating"],
        profileImageURL = map["profileImageURL"];
}
