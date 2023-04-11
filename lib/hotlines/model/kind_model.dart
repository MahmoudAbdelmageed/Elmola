// To parse this JSON data, do
//
//     final kind = kindFromJson(jsonString);

import 'dart:convert';

List<Kind> kindFromJson(String str) => List<Kind>.from(json.decode(str).map((x) => Kind.fromJson(x)));


class Kind {
  Kind({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.template,
    this.listingCategory,
    this.listTags,
    this.location,
    this.wpmlMediaFeatured,
    this.lpListingproOptions,
    this.postViewsCount,
    this.links,
    this.embedded,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  Status? status;
  Type? type;
  String? link;
  Guid? title;
  Content? content;
  int? author;
  int? featuredMedia;
  CommentStatus? commentStatus;
  PingStatus? pingStatus;
  String? template;
  List<int>? listingCategory;
  List<dynamic>? listTags;
  List<dynamic>? location;
  String? wpmlMediaFeatured;
  LpListingproOptions? lpListingproOptions;
  String? postViewsCount;
  KindLinks? links;
  Embedded? embedded;

  factory Kind.fromJson(Map<String, dynamic> json) => Kind(
    id: json["id"] == null ? null : json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
    guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
    modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
    slug: json["slug"] == null ? null : json["slug"],
    status: json["status"] == null ? null : statusValues.map![json["status"]],
    type: json["type"] == null ? null : typeValues.map![json["type"]],
    link: json["link"] == null ? null : json["link"],
    title: json["title"] == null ? null : Guid.fromJson(json["title"]),
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
    author: json["author"] == null ? null : json["author"],
    featuredMedia: json["featured_media"] == null ? null : json["featured_media"],
    commentStatus: json["comment_status"] == null ? null : commentStatusValues.map![json["comment_status"]],
    pingStatus: json["ping_status"] == null ? null : pingStatusValues.map![json["ping_status"]],
    template: json["template"] == null ? null : json["template"],
    listingCategory: json["listing-category"] == null ? null : List<int>.from(json["listing-category"].map((x) => x)),
    listTags: json["list-tags"] == null ? null : List<dynamic>.from(json["list-tags"].map((x) => x)),
    location: json["location"] == null ? null : List<dynamic>.from(json["location"].map((x) => x)),
    wpmlMediaFeatured: json["_wpml_media_featured"] == null ? null : json["_wpml_media_featured"],
    lpListingproOptions: json["lp_listingpro_options"] == null ? null : LpListingproOptions.fromJson(json["lp_listingpro_options"]),
    postViewsCount: json["post_views_count"] == null ? null : json["post_views_count"],
    links: json["_links"] == null ? null : KindLinks.fromJson(json["_links"]),
    embedded: json["_embedded"] == null ? null : Embedded.fromJson(json["_embedded"]),
  );

}

enum CommentStatus { OPEN }

final commentStatusValues = EnumValues({
  "open": CommentStatus.OPEN
});

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    rendered: json["rendered"] == null ? null : json["rendered"],
    protected: json["protected"] == null ? null : json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered == null ? null : rendered,
    "protected": protected == null ? null : protected,
  };
}

class Embedded {
  Embedded({
    this.author,
    this.wpFeaturedmedia,
    this.wpTerm,
  });

  List<EmbeddedAuthor>? author;
  List<WpFeaturedmedia>? wpFeaturedmedia;
  List<List<EmbeddedWpTerm>>? wpTerm;

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
    author: json["author"] == null ? null : List<EmbeddedAuthor>.from(json["author"].map((x) => EmbeddedAuthor.fromJson(x))),
    wpFeaturedmedia: json["wp:featuredmedia"] == null ? null : List<WpFeaturedmedia>.from(json["wp:featuredmedia"].map((x) => WpFeaturedmedia.fromJson(x))),
    wpTerm: json["wp:term"] == null ? null : List<List<EmbeddedWpTerm>>.from(json["wp:term"].map((x) => List<EmbeddedWpTerm>.from(x.map((x) => EmbeddedWpTerm.fromJson(x))))),
  );


}

class EmbeddedAuthor {
  EmbeddedAuthor({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.links,
  });

  int? id;
  SlugEnum? name;
  String? url;
  String? description;
  String? link;
  SlugEnum? slug;
  Map<String, String>? avatarUrls;
  AuthorLinks? links;

  factory EmbeddedAuthor.fromJson(Map<String, dynamic> json) => EmbeddedAuthor(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : slugEnumValues.map![json["name"]],
    url: json["url"] == null ? null : json["url"],
    description: json["description"] == null ? null : json["description"],
    link: json["link"] == null ? null : json["link"],
    slug: json["slug"] == null ? null : slugEnumValues.map![json["slug"]],
    avatarUrls: json["avatar_urls"] == null ? null : Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
    links: json["_links"] == null ? null : AuthorLinks.fromJson(json["_links"]),
  );


}

class AuthorLinks {
  AuthorLinks({
    this.self,
    this.collection,
  });

  List<About>? self;
  List<About>? collection;

  factory AuthorLinks.fromJson(Map<String, dynamic> json) => AuthorLinks(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromJson(x))),
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

enum SlugEnum { MARIAN }

final slugEnumValues = EnumValues({
  "marian": SlugEnum.MARIAN
});

class WpFeaturedmedia {
  WpFeaturedmedia({
    this.id,
    this.date,
    this.slug,
    this.type,
    this.link,
    this.title,
    this.author,
    this.caption,
    this.altText,
    this.mediaType,
    this.mimeType,
    this.mediaDetails,
    this.sourceUrl,
    this.links,
  });

  int? id;
  DateTime? date;
  String? slug;
  String? type;
  String? link;
  Guid? title;
  int? author;
  Guid? caption;
  String? altText;
  String? mediaType;
  MimeType? mimeType;
  MediaDetails? mediaDetails;
  String? sourceUrl;
  WpFeaturedmediaLinks? links;

  factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) => WpFeaturedmedia(
    id: json["id"] == null ? null : json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    slug: json["slug"] == null ? null : json["slug"],
    type: json["type"] == null ? null : json["type"],
    link: json["link"] == null ? null : json["link"],
    title: json["title"] == null ? null : Guid.fromJson(json["title"]),
    author: json["author"] == null ? null : json["author"],
    caption: json["caption"] == null ? null : Guid.fromJson(json["caption"]),
    altText: json["alt_text"] == null ? null : json["alt_text"],
    mediaType: json["media_type"] == null ? null : json["media_type"],
    mimeType: json["mime_type"] == null ? null : mimeTypeValues.map![json["mime_type"]],
    mediaDetails: json["media_details"] == null ? null : MediaDetails.fromJson(json["media_details"]),
    sourceUrl: json["source_url"] == null ? null : json["source_url"],
    links: json["_links"] == null ? null : WpFeaturedmediaLinks.fromJson(json["_links"]),
  );

}

class Guid {
  Guid({
    this.rendered,
  });

  String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
    rendered: json["rendered"] == null ? null : json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered == null ? null : rendered,
  };
}

class WpFeaturedmediaLinks {
  WpFeaturedmediaLinks({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<ReplyElement>? author;
  List<ReplyElement>? replies;

  factory WpFeaturedmediaLinks.fromJson(Map<String, dynamic> json) => WpFeaturedmediaLinks(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromJson(x))),
    author: json["author"] == null ? null : List<ReplyElement>.from(json["author"].map((x) => ReplyElement.fromJson(x))),
    replies: json["replies"] == null ? null : List<ReplyElement>.from(json["replies"].map((x) => ReplyElement.fromJson(x))),
  );


}

class ReplyElement {
  ReplyElement({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory ReplyElement.fromJson(Map<String, dynamic> json) => ReplyElement(
    embeddable: json["embeddable"] == null ? null : json["embeddable"],
    href: json["href"] == null ? null : json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable == null ? null : embeddable,
    "href": href == null ? null : href,
  };
}

class MediaDetails {
  MediaDetails({
    this.width,
    this.height,
    this.file,
    this.sizes,
    this.imageMeta,
  });

  int? width;
  int? height;
  String? file;
  Map<String, Size>? sizes;
  ImageMeta? imageMeta;

  factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    file: json["file"] == null ? null : json["file"],
    sizes: json["sizes"] == null ? null : Map.from(json["sizes"]).map((k, v) => MapEntry<String, Size>(k, Size.fromJson(v))),
    imageMeta: json["image_meta"] == null ? null : ImageMeta.fromJson(json["image_meta"]),
  );


}

class ImageMeta {
  ImageMeta({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
    this.keywords,
  });

  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<dynamic>? keywords;

  factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
    aperture: json["aperture"] == null ? null : json["aperture"],
    credit: json["credit"] == null ? null : json["credit"],
    camera: json["camera"] == null ? null : json["camera"],
    caption: json["caption"] == null ? null : json["caption"],
    createdTimestamp: json["created_timestamp"] == null ? null : json["created_timestamp"],
    copyright: json["copyright"] == null ? null : json["copyright"],
    focalLength: json["focal_length"] == null ? null : json["focal_length"],
    iso: json["iso"] == null ? null : json["iso"],
    shutterSpeed: json["shutter_speed"] == null ? null : json["shutter_speed"],
    title: json["title"] == null ? null : json["title"],
    orientation: json["orientation"] == null ? null : json["orientation"],
    keywords: json["keywords"] == null ? null : List<dynamic>.from(json["keywords"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "aperture": aperture == null ? null : aperture,
    "credit": credit == null ? null : credit,
    "camera": camera == null ? null : camera,
    "caption": caption == null ? null : caption,
    "created_timestamp": createdTimestamp == null ? null : createdTimestamp,
    "copyright": copyright == null ? null : copyright,
    "focal_length": focalLength == null ? null : focalLength,
    "iso": iso == null ? null : iso,
    "shutter_speed": shutterSpeed == null ? null : shutterSpeed,
    "title": title == null ? null : title,
    "orientation": orientation == null ? null : orientation,
  };
}

class Size {
  Size({
    this.file,
    this.width,
    this.height,
    this.mimeType,
    this.sourceUrl,
  });

  String? file;
  int? width;
  int? height;
  MimeType? mimeType;
  String? sourceUrl;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    file: json["file"] == null ? null : json["file"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    mimeType: json["mime_type"] == null ? null : mimeTypeValues.map![json["mime_type"]],
    sourceUrl: json["source_url"] == null ? null : json["source_url"],
  );

  Map<String, dynamic> toJson() => {
    "file": file == null ? null : file,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "mime_type": mimeType == null ? null : mimeTypeValues.reverse[mimeType],
    "source_url": sourceUrl == null ? null : sourceUrl,
  };
}

enum MimeType { IMAGE_JPEG }

final mimeTypeValues = EnumValues({
  "image/jpeg": MimeType.IMAGE_JPEG
});

class EmbeddedWpTerm {
  EmbeddedWpTerm({
    this.id,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.links,
  });

  int? id;
  String? link;
  WpTermName? name;
  Slug? slug;
  Taxonomy? taxonomy;
  WpTermLinks? links;

  factory EmbeddedWpTerm.fromJson(Map<String, dynamic> json) => EmbeddedWpTerm(
    id: json["id"] == null ? null : json["id"],
    link: json["link"] == null ? null : json["link"],
    name: json["name"] == null ? null : wpTermNameValues.map![json["name"]],
    slug: json["slug"] == null ? null : slugValues.map![json["slug"]],
    taxonomy: json["taxonomy"] == null ? null : taxonomyValues.map![json["taxonomy"]],
    links: json["_links"] == null ? null : WpTermLinks.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "link": link == null ? null : link,
    "name": name == null ? null : wpTermNameValues.reverse[name],
    "slug": slug == null ? null : slugValues.reverse[slug],
    "taxonomy": taxonomy == null ? null : taxonomyValues.reverse[taxonomy],
  };
}

class WpTermLinks {
  WpTermLinks({
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

  factory WpTermLinks.fromJson(Map<String, dynamic> json) => WpTermLinks(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromJson(x))),
    wpPostType: json["wp:post_type"] == null ? null : List<About>.from(json["wp:post_type"].map((x) => About.fromJson(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );


}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  CuryName? name;
  Href? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: json["name"] == null ? null : curyNameValues.map![json["name"]],
    href: json["href"] == null ? null : hrefValues.map![json["href"]],
    templated: json["templated"] == null ? null : json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : curyNameValues.reverse[name],
    "href": href == null ? null : hrefValues.reverse[href],
    "templated": templated == null ? null : templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum CuryName { WP }

final curyNameValues = EnumValues({
  "wp": CuryName.WP
});

enum WpTermName { HOME_APPLIANCE_AMP_ELECTRONICS }

final wpTermNameValues = EnumValues({
  "Home Appliance &amp; Electronics": WpTermName.HOME_APPLIANCE_AMP_ELECTRONICS
});

enum Slug { HOME_APPLIANCE_ELECTRONICS }

final slugValues = EnumValues({
  "home-appliance-electronics": Slug.HOME_APPLIANCE_ELECTRONICS
});

enum Taxonomy { LISTING_CATEGORY, LIST_TAGS, LOCATION }

final taxonomyValues = EnumValues({
  "listing-category": Taxonomy.LISTING_CATEGORY,
  "list-tags": Taxonomy.LIST_TAGS,
  "location": Taxonomy.LOCATION
});

class KindLinks {
  KindLinks({
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
  List<ReplyElement>? author;
  List<ReplyElement>? replies;
  List<ReplyElement>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<LinksWpTerm>? wpTerm;
  List<Cury>? curies;

  factory KindLinks.fromJson(Map<String, dynamic> json) => KindLinks(
    self: json["self"] == null ? null : List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? null : List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: json["about"] == null ? null : List<About>.from(json["about"].map((x) => About.fromJson(x))),
    author: json["author"] == null ? null : List<ReplyElement>.from(json["author"].map((x) => ReplyElement.fromJson(x))),
    replies: json["replies"] == null ? null : List<ReplyElement>.from(json["replies"].map((x) => ReplyElement.fromJson(x))),
    wpFeaturedmedia: json["wp:featuredmedia"] == null ? null : List<ReplyElement>.from(json["wp:featuredmedia"].map((x) => ReplyElement.fromJson(x))),
    wpAttachment: json["wp:attachment"] == null ? null : List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
    wpTerm: json["wp:term"] == null ? null : List<LinksWpTerm>.from(json["wp:term"].map((x) => LinksWpTerm.fromJson(x))),
    curies: json["curies"] == null ? null : List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );


}

class LinksWpTerm {
  LinksWpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy? taxonomy;
  bool? embeddable;
  String? href;

  factory LinksWpTerm.fromJson(Map<String, dynamic> json) => LinksWpTerm(
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
    this.lpPurchaseDays,
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
  var businessHours;
  String? campaignId;
  String? changedPlanid;
  String? listingReportedBy;
  String? listingReported;
  String? businessLogo;
  var lpPurchaseDays;

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
    lpPurchaseDays: json["lp_purchase_days"] == null ? null : json["lp_purchase_days"],
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
    "lp_purchase_days": lpPurchaseDays == null ? null : lpPurchaseDays,
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

enum PingStatus { CLOSED }

final pingStatusValues = EnumValues({
  "closed": PingStatus.CLOSED
});

enum Status { PUBLISH }

final statusValues = EnumValues({
  "publish": Status.PUBLISH
});

enum Type { LISTING }

final typeValues = EnumValues({
  "listing": Type.LISTING
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
