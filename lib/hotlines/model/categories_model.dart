// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  Categories({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    this.meta,
    this.yoastHead,
    this.links,
  });

  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  Taxonomy? taxonomy;
  int? parent;
  List<dynamic>? meta;
  String? yoastHead;
  Links? links;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["id"] == null ? null : json["id"],
    count: json["count"] == null ? null : json["count"],
    description: json["description"] == null ? null : json["description"],
    link: json["link"] == null ? null : json["link"],
    name: json["name"] == null ? null : json["name"],
    slug: json["slug"] == null ? null : json["slug"],
    taxonomy: json["taxonomy"] == null ? null : taxonomyValues.map![json["taxonomy"]],
    parent: json["parent"] == null ? null : json["parent"],
    meta: json["meta"] == null ? null : List<dynamic>.from(json["meta"].map((x) => x)),
    yoastHead: json["yoast_head"] == null ? null : json["yoast_head"],
    links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "count": count == null ? null : count,
    "description": description == null ? null : description,
    "link": link == null ? null : link,
    "name": name == null ? null : name,
    "slug": slug == null ? null : slug,
    "taxonomy": taxonomy == null ? null : taxonomyValues.reverse[taxonomy],
    "parent": parent == null ? null : parent,
    "meta": meta == null ? null : List<dynamic>.from(meta!.map((x) => x)),
    "yoast_head": yoastHead == null ? null : yoastHead,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<About>? wpPostType;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromJson(x))),
    wpPostType: json["wp:post_type"] == null ? null : List<About>.from(json["wp:post_type"].map((x) => About.fromJson(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href == null ? null : href,
  };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  Name? name;
  Href? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: json["name"] == null ? null : nameValues.map![json["name"]],
    href: json["href"] == null ? null : hrefValues.map![json["href"]],
    templated: json["templated"] == null ? null : json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : nameValues.reverse[name],
    "href": href == null ? null : hrefValues.reverse[href],
    "templated": templated == null ? null : templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
  "wp": Name.WP
});

enum Taxonomy { LISTING_CATEGORY }

final taxonomyValues = EnumValues({
  "listing-category": Taxonomy.LISTING_CATEGORY
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
