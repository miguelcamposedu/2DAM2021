class LuzResponse {
  LuzResponse({
    required this.indicator,
  });
  late final Indicator indicator;
  
  LuzResponse.fromJson(Map<String, dynamic> json){
    indicator = Indicator.fromJson(json['indicator']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['indicator'] = indicator.toJson();
    return _data;
  }
}

class Indicator {
  Indicator({
    required this.name,
    required this.shortName,
    required this.id,
    required this.composited,
    required this.stepType,
    required this.disaggregated,
    required this.magnitud,
    required this.tiempo,
    required this.geos,
    required this.valuesUpdatedAt,
    required this.values,
  });
  late final String name;
  late final String shortName;
  late final int id;
  late final bool composited;
  late final String stepType;
  late final bool disaggregated;
  late final List<Magnitud> magnitud;
  late final List<Tiempo> tiempo;
  late final List<Geos> geos;
  late final String valuesUpdatedAt;
  late final List<PrecioLuz> values;
  
  Indicator.fromJson(Map<String, dynamic> json){
    name = json['name'];
    shortName = json['short_name'];
    id = json['id'];
    composited = json['composited'];
    stepType = json['step_type'];
    disaggregated = json['disaggregated'];
    magnitud = List.from(json['magnitud']).map((e)=>Magnitud.fromJson(e)).toList();
    tiempo = List.from(json['tiempo']).map((e)=>Tiempo.fromJson(e)).toList();
    geos = List.from(json['geos']).map((e)=>Geos.fromJson(e)).toList();
    valuesUpdatedAt = json['values_updated_at'];
    values = List.from(json['values']).map((e)=>PrecioLuz.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['short_name'] = shortName;
    _data['id'] = id;
    _data['composited'] = composited;
    _data['step_type'] = stepType;
    _data['disaggregated'] = disaggregated;
    _data['magnitud'] = magnitud.map((e)=>e.toJson()).toList();
    _data['tiempo'] = tiempo.map((e)=>e.toJson()).toList();
    _data['geos'] = geos.map((e)=>e.toJson()).toList();
    _data['values_updated_at'] = valuesUpdatedAt;
    _data['values'] = values.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Magnitud {
  Magnitud({
    required this.name,
    required this.id,
  });
  late final String name;
  late final int id;
  
  Magnitud.fromJson(Map<String, dynamic> json){
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}

class Tiempo {
  Tiempo({
    required this.name,
    required this.id,
  });
  late final String name;
  late final int id;
  
  Tiempo.fromJson(Map<String, dynamic> json){
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}

class Geos {
  Geos({
    required this.geoId,
    required this.geoName,
  });
  late final int geoId;
  late final String geoName;
  
  Geos.fromJson(Map<String, dynamic> json){
    geoId = json['geo_id'];
    geoName = json['geo_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['geo_id'] = geoId;
    _data['geo_name'] = geoName;
    return _data;
  }
}

class PrecioLuz {
  PrecioLuz({
    required this.value,
    required this.datetime,
    required this.datetimeUtc,
    required this.tzTime,
    required this.geoId,
    required this.geoName,
  });
  late final double value;
  late final String datetime;
  late final String datetimeUtc;
  late final String tzTime;
  late final int geoId;
  late final String geoName;
  
  PrecioLuz.fromJson(Map<String, dynamic> json){
    value = json['value'];
    datetime = json['datetime'];
    datetimeUtc = json['datetime_utc'];
    tzTime = json['tz_time'];
    geoId = json['geo_id'];
    geoName = json['geo_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['datetime'] = datetime;
    _data['datetime_utc'] = datetimeUtc;
    _data['tz_time'] = tzTime;
    _data['geo_id'] = geoId;
    _data['geo_name'] = geoName;
    return _data;
  }
}