class PeopleResponse {
  PeopleResponse({
    required this.count,
    required this.next,
     this.previous,
    required this.results,
  });
  late final int count;
  late final String next;
  late final Null previous;
  late final List<Person> results;
  
  PeopleResponse.fromJson(Map<String, dynamic> json){
    count = json['count'];
    next = json['next'];
    previous = null;
    results = List.from(json['results']).map((e)=>Person.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['next'] = next;
    _data['previous'] = previous;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Person {
  Person({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });
  late final String name;
  late final String height;
  late final String mass;
  late final String hairColor;
  late final String skinColor;
  late final String eyeColor;
  late final String birthYear;
  late final String gender;
  late final String homeworld;
  late final List<String> films;
  late final List<String> species;
  late final List<String> vehicles;
  late final List<String> starships;
  late final String created;
  late final String edited;
  late final String url;
  
  Person.fromJson(Map<String, dynamic> json){
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeworld = json['homeworld'];
    films = List.castFrom<dynamic, String>(json['films']);
    species = List.castFrom<dynamic, String>(json['species']);
    vehicles = List.castFrom<dynamic, String>(json['vehicles']);
    starships = List.castFrom<dynamic, String>(json['starships']);
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['height'] = height;
    _data['mass'] = mass;
    _data['hair_color'] = hairColor;
    _data['skin_color'] = skinColor;
    _data['eye_color'] = eyeColor;
    _data['birth_year'] = birthYear;
    _data['gender'] = gender;
    _data['homeworld'] = homeworld;
    _data['films'] = films;
    _data['species'] = species;
    _data['vehicles'] = vehicles;
    _data['starships'] = starships;
    _data['created'] = created;
    _data['edited'] = edited;
    _data['url'] = url;
    return _data;
  }
}