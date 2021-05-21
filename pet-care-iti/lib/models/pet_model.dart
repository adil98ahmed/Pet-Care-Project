class Pet {
  String species;
  String name;
  String breed;
  String img;
  String weight;
  String birthOfDate;
  String id;
  String gender;
  bool vaccinated;
  bool friendlyWithDogs;
  bool friendlyWithCats;
  bool friendlyWithKids;
  bool microchipped;

  Pet({
    this.species = "",
    this.name = "",
    this.breed = "",
    this.img =
        "https://firebasestorage.googleapis.com/v0/b/pet-care-29230.appspot.com/o/pet-house.png?alt=media&token=1d8322c6-c279-4dc0-8f3a-b15733478eeb",
    this.weight = "",
    this.birthOfDate = "",
    this.vaccinated,
    this.id,
    this.friendlyWithDogs,
    this.gender,
    this.friendlyWithCats,
    this.friendlyWithKids,
    this.microchipped,
  });

  Pet.fromJson(Map<dynamic, dynamic> map)
      : species = map['species'] ?? "",
        name = map['name'] ?? "",
        breed = map['breed'] ?? "",
        img = map['img'] ?? "",
        weight = map['weight'] ?? "",
        birthOfDate = map['birthOfDate'] ?? "",
        id = map['id'] ?? "",
        vaccinated = map['vaccinated'] ?? false,
        friendlyWithDogs = map['friendlyWithDogs'] ?? false,
        friendlyWithCats = map['friendlyWithCats'] ?? false,
        friendlyWithKids = map['friendlyWithKids'] ?? false,
        microchipped = map['microchipped'] ?? false,
        gender = map['gender'] ?? "";

  Map<String, dynamic> toJson() => {
        'species': species,
        'name': name,
        'img': img,
        'breed': breed,
        'weight': weight,
        'birthOfDate': birthOfDate,
        'id': id,
        'gender': gender,
        'vaccinated': vaccinated,
        'friendlyWithDogs': friendlyWithDogs,
        'friendlyWithCats': friendlyWithCats,
        'friendlyWithKids': friendlyWithKids,
        'microchipped': microchipped,
      };
}
