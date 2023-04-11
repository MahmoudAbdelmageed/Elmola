// To parse this JSON data, do
//
//     final serachingModel = serachingModelFromJson(jsonString);

import 'dart:convert';

List<SerachingModel> serachingModelFromJson(String str) => List<SerachingModel>.from(json.decode(str).map((x) => SerachingModel.fromJson(x)));


class SerachingModel {
  SerachingModel({
    this.id,
    this.title,
    this.url,
    this.type,
    this.subtype,
    this.links,
    this.embedded,
  });

  int? id;
  String? title;
  String? url;
  PurpleType? type;
  SubtypeEnum? subtype;
  SerachingModelLinks? links;
  Embedded? embedded;

  factory SerachingModel.fromJson(Map<String, dynamic> json) => SerachingModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    type: json["type"] == null ? null : purpleTypeValues.map![json["type"]],
    subtype: json["subtype"] == null ? null : subtypeEnumValues.map![json["subtype"]],
    links: json["_links"] == null ? null : SerachingModelLinks.fromJson(json["_links"]),
    embedded: json["_embedded"] == null ? null : Embedded.fromJson(json["_embedded"]),
  );

}

class Embedded {
  Embedded({
    this.self,
  });

  List<EmbeddedSelf>? self;

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
    self: json["self"] == null ? null : List<EmbeddedSelf>.from(json["self"].map((x) => EmbeddedSelf.fromJson(x))),
  );


}

class EmbeddedSelf {
  EmbeddedSelf({
    this.id,
    this.date,
    this.slug,
    this.type,
    this.link,
    this.title,
    this.author,
    this.featuredMedia,
    this.wpmlMediaFeatured,
    this.lpListingproOptions,
    this.postViewsCount,
    this.links,
  });

  int? id;
  DateTime? date;
  String? slug;
  SubtypeEnum? type;
  String? link;
  Title? title;
  int? author;
  int? featuredMedia;
  String? wpmlMediaFeatured;
  LpListingproOptions? lpListingproOptions;
  String? postViewsCount;
  SelfLinks? links;

  factory EmbeddedSelf.fromJson(Map<String, dynamic> json) => EmbeddedSelf(
    id: json["id"] == null ? null : json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    slug: json["slug"] == null ? null : json["slug"],
    type: json["type"] == null ? null : subtypeEnumValues.map![json["type"]],
    link: json["link"] == null ? null : json["link"],
    title: json["title"] == null ? null : Title.fromJson(json["title"]),
    author: json["author"] == null ? null : json["author"],
    featuredMedia: json["featured_media"] == null ? null : json["featured_media"],
    wpmlMediaFeatured: json["_wpml_media_featured"] == null ? null : json["_wpml_media_featured"],
    lpListingproOptions: json["lp_listingpro_options"] == null ? null : LpListingproOptions.fromJson(json["lp_listingpro_options"]),
    postViewsCount: json["post_views_count"] == null ? null : json["post_views_count"],
    links: json["_links"] == null ? null : SelfLinks.fromJson(json["_links"]),
  );


}

class SelfLinks {
  SelfLinks({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<AuthorElement>? author;
  List<AuthorElement>? replies;
  List<AuthorElement>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  factory SelfLinks.fromJson(Map<String, dynamic> json) => SelfLinks(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromJson(x))),
    author: json["author"] == null ? null : List<AuthorElement>.from(json["author"].map((x) => AuthorElement.fromJson(x))),
    replies: json["replies"] == null ? null : List<AuthorElement>.from(json["replies"].map((x) => AuthorElement.fromJson(x))),
    wpFeaturedmedia: json["wp:featuredmedia"] == null ? null : List<AuthorElement>.from(json["wp:featuredmedia"].map((x) => AuthorElement.fromJson(x))),
    wpAttachment: json["wp:attachment"] == null ? null : List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
    wpTerm: json["wp:term"] == null ? null : List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
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

class AuthorElement {
  AuthorElement({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory AuthorElement.fromJson(Map<String, dynamic> json) => AuthorElement(
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable == null ? null : embeddable,
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

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
    taxonomy: json["taxonomy"] == null ? null : taxonomyValues.map![json["taxonomy"]],
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy": taxonomy == null ? null : taxonomyValues.reverse[taxonomy],
    "embeddable": embeddable == null ? null : embeddable,
    "href": href == null ? null : href,
  };
}

enum Taxonomy { LISTING_CATEGORY, LIST_TAGS, LOCATION }

final taxonomyValues = EnumValues({
  "listing-category": Taxonomy.LISTING_CATEGORY,
  "list-tags": Taxonomy.LIST_TAGS,
  "location": Taxonomy.LOCATION
});

class LpListingproOptions {
  LpListingproOptions({
    this.taglineText,
    this.gAddress,
    this.latitude,
    this.longitude,
    this.mappin,
    this.phone,
    this.whatsapp,
    this.email,
    this.website,
    this.twitter,
    this.facebook,
    this.linkedin,
    this.googlePlus,
    this.youtube,
    this.instagram,
    this.video,
    this.gallery,
    this.priceStatus,
    this.listPrice,
    this.listPriceTo,
    this.planId,
    this.reviewsIds,
    this.claimedSection,
    this.listingsAdsPurchaseDate,
    this.listingsAdsPurchasePackages,
    this.faqs,
    this.businessHours,
    this.campaignId,
    this.changedPlanid,
    this.listingReportedBy,
    this.listingReported,
    this.businessLogo,
  });

  String? taglineText;
  String? gAddress;
  String? latitude;
  String? longitude;
  String? mappin;
  String? phone;
  String? whatsapp;
  String? email;
  String? website;
  String? twitter;
  String? facebook;
  String? linkedin;
  String? googlePlus;
  String? youtube;
  String? instagram;
  String? video;
  String? gallery;
  PriceStatus? priceStatus;
  String? listPrice;
  String? listPriceTo;
  String? planId;
  String? reviewsIds;
  ClaimedSection? claimedSection;
  String? listingsAdsPurchaseDate;
  String? listingsAdsPurchasePackages;
  Faqs? faqs;
  String? businessHours;
  String? campaignId;
  String? changedPlanid;
  String? listingReportedBy;
  String? listingReported;
  String? businessLogo;

  factory LpListingproOptions.fromJson(Map<String, dynamic> json) => LpListingproOptions(
    taglineText: json["tagline_text"] == null ? null : json["tagline_text"],
    gAddress: json["gAddress"] == null ? null : json["gAddress"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    mappin: json["mappin"] == null ? null : json["mappin"],
    phone: json["phone"] == null ? null : json["phone"],
    whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
    email: json["email"] == null ? null : json["email"],
    website: json["website"] == null ? null : json["website"],
    twitter: json["twitter"] == null ? null : json["twitter"],
    facebook: json["facebook"] == null ? null : json["facebook"],
    linkedin: json["linkedin"] == null ? null : json["linkedin"],
    googlePlus: json["google_plus"] == null ? null : json["google_plus"],
    youtube: json["youtube"] == null ? null : json["youtube"],
    instagram: json["instagram"] == null ? null : json["instagram"],
    video: json["video"] == null ? null : json["video"],
    gallery: json["gallery"] == null ? null : json["gallery"],
    priceStatus: json["price_status"] == null ? null : priceStatusValues.map![json["price_status"]],
    listPrice: json["list_price"] == null ? null : json["list_price"],
    listPriceTo: json["list_price_to"] == null ? null : json["list_price_to"],
    planId: json["Plan_id"] == null ? null : json["Plan_id"],
    reviewsIds: json["reviews_ids"] == null ? null : json["reviews_ids"],
    claimedSection: json["claimed_section"] == null ? null : claimedSectionValues.map![json["claimed_section"]],
    listingsAdsPurchaseDate: json["listings_ads_purchase_date"] == null ? null : json["listings_ads_purchase_date"],
    listingsAdsPurchasePackages: json["listings_ads_purchase_packages"] == null ? null : json["listings_ads_purchase_packages"],
    faqs: json["faqs"] == null ? null : Faqs.fromJson(json["faqs"]),
    businessHours: json["business_hours"] == null ? null : json["business_hours"],
    campaignId: json["campaign_id"] == null ? null : json["campaign_id"],
    changedPlanid: json["changed_planid"] == null ? null : json["changed_planid"],
    listingReportedBy: json["listing_reported_by"] == null ? null : json["listing_reported_by"],
    listingReported: json["listing_reported"] == null ? null : json["listing_reported"],
    businessLogo: json["business_logo"] == null ? null : json["business_logo"],
  );

  Map<String, dynamic> toJson() => {
    "tagline_text": taglineText == null ? null : taglineText,
    "gAddress": gAddress == null ? null : gAddress,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "mappin": mappin == null ? null : mappin,
    "phone": phone == null ? null : phone,
    "whatsapp": whatsapp == null ? null : whatsapp,
    "email": email == null ? null : email,
    "website": website == null ? null : website,
    "twitter": twitter == null ? null : twitter,
    "facebook": facebook == null ? null : facebook,
    "linkedin": linkedin == null ? null : linkedin,
    "google_plus": googlePlus == null ? null : googlePlus,
    "youtube": youtube == null ? null : youtube,
    "instagram": instagram == null ? null : instagram,
    "video": video == null ? null : video,
    "gallery": gallery == null ? null : gallery,
    "price_status": priceStatus == null ? null : priceStatusValues.reverse[priceStatus],
    "list_price": listPrice == null ? null : listPrice,
    "list_price_to": listPriceTo == null ? null : listPriceTo,
    "Plan_id": planId == null ? null : planId,
    "reviews_ids": reviewsIds == null ? null : reviewsIds,
    "claimed_section": claimedSection == null ? null : claimedSectionValues.reverse[claimedSection],
    "listings_ads_purchase_date": listingsAdsPurchaseDate == null ? null : listingsAdsPurchaseDate,
    "listings_ads_purchase_packages": listingsAdsPurchasePackages == null ? null : listingsAdsPurchasePackages,
    "business_hours": businessHours == null ? null : businessHours,
    "campaign_id": campaignId == null ? null : campaignId,
    "changed_planid": changedPlanid == null ? null : changedPlanid,
    "listing_reported_by": listingReportedBy == null ? null : listingReportedBy,
    "listing_reported": listingReported == null ? null : listingReported,
    "business_logo": businessLogo == null ? null : businessLogo,
  };
}

enum ClaimedSection { NOT_CLAIMED }

final claimedSectionValues = EnumValues({
  "not_claimed": ClaimedSection.NOT_CLAIMED
});

class Faqs {
  Faqs({
    this.faq,
    this.faqans,
  });

  Faq? faq;
  Faq? faqans;

  factory Faqs.fromJson(Map<String, dynamic> json) => Faqs(
    faq: json["faq"] == null ? null : Faq.fromJson(json["faq"]),
    faqans: json["faqans"] == null ? null : Faq.fromJson(json["faqans"]),
  );


}

class Faq {
  Faq({
    this.the1,
  });

  String? the1;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
    the1: json["1"] == null ? null : json["1"],
  );

  Map<String, dynamic> toJson() => {
    "1": the1 == null ? null : the1,
  };
}

enum PriceStatus { NOTSAY }

final priceStatusValues = EnumValues({
  "notsay": PriceStatus.NOTSAY
});

class Title {
  Title({
    this.rendered,
  });

  String? rendered;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    rendered: json["rendered"] == null ? null : json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered == null ? null : rendered,
  };
}

enum SubtypeEnum { LISTING }

final subtypeEnumValues = EnumValues({
  "listing": SubtypeEnum.LISTING
});

class SerachingModelLinks {
  SerachingModelLinks({
    this.self,
    this.about,
    this.collection,
  });

  List<AuthorElement>? self;
  List<About>? about;
  List<About>? collection;

  factory SerachingModelLinks.fromJson(Map<String, dynamic> json) => SerachingModelLinks(
    self: json["self"] == null ? null : List<AuthorElement>.from(json["self"].map((x) => AuthorElement.fromJson(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromJson(x))),
  );


}

enum PurpleType { POST }

final purpleTypeValues = EnumValues({
  "post": PurpleType.POST
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
