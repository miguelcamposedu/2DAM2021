class PokemonResponse {
  PokemonResponse({
    required this.count,
    required this.next,
     this.previous,
    required this.results,
  });
  late final int count;
  late final String next;
  late final Null previous;
  late final List<Pokemon> results;
  
  PokemonResponse.fromJson(Map<String, dynamic> json){
    count = json['count'];
    next = json['next'];
    previous = null;
    results = List.from(json['results']).map((e)=>Pokemon.fromJson(e)).toList();
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

class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;
  
  Pokemon.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}