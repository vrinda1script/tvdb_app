class MoviesListResponseModel {
  String? status;
  List<MoviesList>? data;
  Links? links;

  MoviesListResponseModel({
    this.status,
    this.data,
    this.links,
  });

  factory MoviesListResponseModel.fromJson(Map<String, dynamic> json) =>
      MoviesListResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<MoviesList>.from(
                json["data"]!.map((x) => MoviesList.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
      };
}

class MoviesList {
  int? id;
  String? name;
  String? slug;
  String? image;
  List<NameTranslation>? nameTranslations;
  List<NameTranslation>? overviewTranslations;
  List<Alias>? aliases;
  int? score;
  int? runtime;
  Status? status;
  DateTime? lastUpdated;
  String? year;

  MoviesList({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.nameTranslations,
    this.overviewTranslations,
    this.aliases,
    this.score,
    this.runtime,
    this.status,
    this.lastUpdated,
    this.year,
  });

  factory MoviesList.fromJson(Map<String, dynamic> json) => MoviesList(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        nameTranslations: json["nameTranslations"] == null
            ? []
            : List<NameTranslation>.from(json["nameTranslations"]!
                .map((x) => nameTranslationValues.map[x]!)),
        overviewTranslations: json["overviewTranslations"] == null
            ? []
            : List<NameTranslation>.from(json["overviewTranslations"]!
                .map((x) => nameTranslationValues.map[x]!)),
        aliases: json["aliases"] == null
            ? []
            : List<Alias>.from(json["aliases"]!.map((x) => Alias.fromJson(x))),
        score: json["score"],
        runtime: json["runtime"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        lastUpdated: json["lastUpdated"] == null
            ? null
            : DateTime.parse(json["lastUpdated"]),
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "nameTranslations": nameTranslations == null
            ? []
            : List<dynamic>.from(
                nameTranslations!.map((x) => nameTranslationValues.reverse[x])),
        "overviewTranslations": overviewTranslations == null
            ? []
            : List<dynamic>.from(overviewTranslations!
                .map((x) => nameTranslationValues.reverse[x])),
        "aliases": aliases == null
            ? []
            : List<dynamic>.from(aliases!.map((x) => x.toJson())),
        "score": score,
        "runtime": runtime,
        "status": status?.toJson(),
        "lastUpdated": lastUpdated?.toIso8601String(),
        "year": year,
      };
}

class Alias {
  NameTranslation? language;
  String? name;

  Alias({
    this.language,
    this.name,
  });

  factory Alias.fromJson(Map<String, dynamic> json) => Alias(
        language: nameTranslationValues.map[json["language"]]!,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": nameTranslationValues.reverse[language],
        "name": name,
      };
}

enum NameTranslation {
  ARA,
  BEL,
  BUL,
  CAT,
  CES,
  DAN,
  DEU,
  ELL,
  ENG,
  EST,
  EUS,
  FAS,
  FIN,
  FRA,
  HEB,
  HIN,
  HRV,
  HUN,
  IND,
  ITA,
  JPN,
  KAT,
  KOR,
  LAT,
  LAV,
  LIT,
  MSA,
  NLD,
  NOR,
  POL,
  POR,
  PT,
  RON,
  RUS,
  SLK,
  SLV,
  SPA,
  SRP,
  SWE,
  TAM,
  THA,
  TUR,
  UKR,
  VIE,
  YUE,
  ZHO,
  ZHTW
}

final nameTranslationValues = EnumValues({
  "ara": NameTranslation.ARA,
  "bel": NameTranslation.BEL,
  "bul": NameTranslation.BUL,
  "cat": NameTranslation.CAT,
  "ces": NameTranslation.CES,
  "dan": NameTranslation.DAN,
  "deu": NameTranslation.DEU,
  "ell": NameTranslation.ELL,
  "eng": NameTranslation.ENG,
  "est": NameTranslation.EST,
  "eus": NameTranslation.EUS,
  "fas": NameTranslation.FAS,
  "fin": NameTranslation.FIN,
  "fra": NameTranslation.FRA,
  "heb": NameTranslation.HEB,
  "hin": NameTranslation.HIN,
  "hrv": NameTranslation.HRV,
  "hun": NameTranslation.HUN,
  "ind": NameTranslation.IND,
  "ita": NameTranslation.ITA,
  "jpn": NameTranslation.JPN,
  "kat": NameTranslation.KAT,
  "kor": NameTranslation.KOR,
  "lat": NameTranslation.LAT,
  "lav": NameTranslation.LAV,
  "lit": NameTranslation.LIT,
  "msa": NameTranslation.MSA,
  "nld": NameTranslation.NLD,
  "nor": NameTranslation.NOR,
  "pol": NameTranslation.POL,
  "por": NameTranslation.POR,
  "pt": NameTranslation.PT,
  "ron": NameTranslation.RON,
  "rus": NameTranslation.RUS,
  "slk": NameTranslation.SLK,
  "slv": NameTranslation.SLV,
  "spa": NameTranslation.SPA,
  "srp": NameTranslation.SRP,
  "swe": NameTranslation.SWE,
  "tam": NameTranslation.TAM,
  "tha": NameTranslation.THA,
  "tur": NameTranslation.TUR,
  "ukr": NameTranslation.UKR,
  "vie": NameTranslation.VIE,
  "yue": NameTranslation.YUE,
  "zho": NameTranslation.ZHO,
  "zhtw": NameTranslation.ZHTW
});

class Status {
  int? id;
  Name? name;
  RecordType? recordType;
  bool? keepUpdated;

  Status({
    this.id,
    this.name,
    this.recordType,
    this.keepUpdated,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        recordType: recordTypeValues.map[json["recordType"]]!,
        keepUpdated: json["keepUpdated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "recordType": recordTypeValues.reverse[recordType],
        "keepUpdated": keepUpdated,
      };
}

enum Name { RELEASED }

final nameValues = EnumValues({"Released": Name.RELEASED});

enum RecordType { MOVIE }

final recordTypeValues = EnumValues({"movie": RecordType.MOVIE});

class Links {
  dynamic prev;
  String? self;
  String? next;
  int? totalItems;
  int? pageSize;

  Links({
    this.prev,
    this.self,
    this.next,
    this.totalItems,
    this.pageSize,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        prev: json["prev"],
        self: json["self"],
        next: json["next"],
        totalItems: json["total_items"],
        pageSize: json["page_size"],
      );

  Map<String, dynamic> toJson() => {
        "prev": prev,
        "self": self,
        "next": next,
        "total_items": totalItems,
        "page_size": pageSize,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
