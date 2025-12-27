class NewsAndMediaResponse {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  Meta? meta;
  List<String>? classList;
  String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  String? sElementorControlsUsage;
  String? sUserLiked;
  String? sPostLikeCount;
  String? sPostLikeModified;
  String? sWpPageTemplate;
  String? slideTemplate;
  String? sWpOldSlug;
  String? postImage;
  String? rsPageBgColor;
  String? sThumbnailId;
  UserIP? uUserIP;
  String? sEaelPostViewCount;
  String? postAudio;
  String? sWpOldDate;
  String? sWxrImportTerm;
  String? sEditLast;
  String? postLink;
  String? textLink;
  String? postVideo;
  String? bgVideo;
  String? postQuote;
  String? quoteName;
  String? postGallery;
  String? sEditLock;
  // Links? lLinks;

  NewsAndMediaResponse(
      {this.id,
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
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.commentStatus,
        this.pingStatus,
        this.sticky,
        this.template,
        this.format,
        this.meta,
        this.classList,
        this.yoastHead,
        this.yoastHeadJson,
        this.sElementorControlsUsage,
        this.sUserLiked,
        this.sPostLikeCount,
        this.sPostLikeModified,
        this.sWpPageTemplate,
        this.slideTemplate,
        this.sWpOldSlug,
        this.postImage,
        this.rsPageBgColor,
        this.sThumbnailId,
        this.uUserIP,
        this.sEaelPostViewCount,
        this.postAudio,
        this.sWpOldDate,
        this.sWxrImportTerm,
        this.sEditLast,
        this.postLink,
        this.textLink,
        this.postVideo,
        this.bgVideo,
        this.postQuote,
        this.quoteName,
        this.postGallery,
        this.sEditLock,
        // this.lLinks
  });

  NewsAndMediaResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    excerpt =
    json['excerpt'] != null ? new Content.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    classList = json['class_list'].cast<String>();
    yoastHead = json['yoast_head'];
    yoastHeadJson = json['yoast_head_json'] != null
        ? new YoastHeadJson.fromJson(json['yoast_head_json'])
        : null;
    sElementorControlsUsage = json['_elementor_controls_usage'];
    sUserLiked = json['_user_liked'];
    sPostLikeCount = json['_post_like_count'];
    sPostLikeModified = json['_post_like_modified'];
    sWpPageTemplate = json['_wp_page_template'];
    slideTemplate = json['slide_template'];
    sWpOldSlug = json['_wp_old_slug'];
    postImage = json['post_image'];
    rsPageBgColor = json['rs_page_bg_color'];
    sThumbnailId = json['_thumbnail_id'];
    uUserIP =
    json['_user_IP'] != null ? new UserIP.fromJson(json['_user_IP']) : null;
    sEaelPostViewCount = json['_eael_post_view_count'];
    postAudio = json['post_audio'];
    sWpOldDate = json['_wp_old_date'];
    sWxrImportTerm = json['_wxr_import_term'];
    sEditLast = json['_edit_last'];
    postLink = json['post_link'];
    textLink = json['text_link'];
    postVideo = json['post_video'];
    bgVideo = json['bg_video'];
    postQuote = json['post_quote'];
    quoteName = json['quote_name'];
    postGallery = json['post_gallery'];
    sEditLock = json['_edit_lock'];
    // lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid!.toJson();
    }
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.excerpt != null) {
      data['excerpt'] = this.excerpt!.toJson();
    }
    data['author'] = this.author;
    data['featured_media'] = this.featuredMedia;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['sticky'] = this.sticky;
    data['template'] = this.template;
    data['format'] = this.format;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['class_list'] = this.classList;
    data['yoast_head'] = this.yoastHead;
    if (this.yoastHeadJson != null) {
      data['yoast_head_json'] = this.yoastHeadJson!.toJson();
    }
    data['_elementor_controls_usage'] = this.sElementorControlsUsage;
    data['_user_liked'] = this.sUserLiked;
    data['_post_like_count'] = this.sPostLikeCount;
    data['_post_like_modified'] = this.sPostLikeModified;
    data['_wp_page_template'] = this.sWpPageTemplate;
    data['slide_template'] = this.slideTemplate;
    data['_wp_old_slug'] = this.sWpOldSlug;
    data['post_image'] = this.postImage;
    data['rs_page_bg_color'] = this.rsPageBgColor;
    data['_thumbnail_id'] = this.sThumbnailId;
    if (this.uUserIP != null) {
      data['_user_IP'] = this.uUserIP!.toJson();
    }
    data['_eael_post_view_count'] = this.sEaelPostViewCount;
    data['post_audio'] = this.postAudio;
    data['_wp_old_date'] = this.sWpOldDate;
    data['_wxr_import_term'] = this.sWxrImportTerm;
    data['_edit_last'] = this.sEditLast;
    data['post_link'] = this.postLink;
    data['text_link'] = this.textLink;
    data['post_video'] = this.postVideo;
    data['bg_video'] = this.bgVideo;
    data['post_quote'] = this.postQuote;
    data['quote_name'] = this.quoteName;
    data['post_gallery'] = this.postGallery;
    data['_edit_lock'] = this.sEditLock;
    // if (this.lLinks != null) {
    //   data['_links'] = this.lLinks!.toJson();
    // }
    return data;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

class Meta {
  String? footnotes;

  Meta({this.footnotes});

  Meta.fromJson(Map<String, dynamic> json) {
    footnotes = json['footnotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['footnotes'] = this.footnotes;
    return data;
  }
}

class YoastHeadJson {
  String? title;
  Robots? robots;
  String? ogLocale;
  String? ogType;
  String? ogTitle;
  String? ogDescription;
  String? ogUrl;
  String? ogSiteName;
  String? articlePublishedTime;
  String? articleModifiedTime;
  List<OgImage>? ogImage;
  String? author;
  String? twitterCard;
  TwitterMisc? twitterMisc;
  Schema? schema;

  YoastHeadJson(
      {this.title,
        this.robots,
        this.ogLocale,
        this.ogType,
        this.ogTitle,
        this.ogDescription,
        this.ogUrl,
        this.ogSiteName,
        this.articlePublishedTime,
        this.articleModifiedTime,
        this.ogImage,
        this.author,
        this.twitterCard,
        this.twitterMisc,
        this.schema});

  YoastHeadJson.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    robots =
    json['robots'] != null ? new Robots.fromJson(json['robots']) : null;
    ogLocale = json['og_locale'];
    ogType = json['og_type'];
    ogTitle = json['og_title'];
    ogDescription = json['og_description'];
    ogUrl = json['og_url'];
    ogSiteName = json['og_site_name'];
    articlePublishedTime = json['article_published_time'];
    articleModifiedTime = json['article_modified_time'];
    if (json['og_image'] != null) {
      ogImage = <OgImage>[];
      json['og_image'].forEach((v) {
        ogImage!.add(new OgImage.fromJson(v));
      });
    }
    author = json['author'];
    twitterCard = json['twitter_card'];
    twitterMisc = json['twitter_misc'] != null
        ? new TwitterMisc.fromJson(json['twitter_misc'])
        : null;
    schema =
    json['schema'] != null ? new Schema.fromJson(json['schema']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.robots != null) {
      data['robots'] = this.robots!.toJson();
    }
    data['og_locale'] = this.ogLocale;
    data['og_type'] = this.ogType;
    data['og_title'] = this.ogTitle;
    data['og_description'] = this.ogDescription;
    data['og_url'] = this.ogUrl;
    data['og_site_name'] = this.ogSiteName;
    data['article_published_time'] = this.articlePublishedTime;
    data['article_modified_time'] = this.articleModifiedTime;
    if (this.ogImage != null) {
      data['og_image'] = this.ogImage!.map((v) => v.toJson()).toList();
    }
    data['author'] = this.author;
    data['twitter_card'] = this.twitterCard;
    if (this.twitterMisc != null) {
      data['twitter_misc'] = this.twitterMisc!.toJson();
    }
    if (this.schema != null) {
      data['schema'] = this.schema!.toJson();
    }
    return data;
  }
}

class Robots {
  String? index;
  String? follow;
  String? maxSnippet;
  String? maxImagePreview;
  String? maxVideoPreview;

  Robots(
      {this.index,
        this.follow,
        this.maxSnippet,
        this.maxImagePreview,
        this.maxVideoPreview});

  Robots.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    follow = json['follow'];
    maxSnippet = json['max-snippet'];
    maxImagePreview = json['max-image-preview'];
    maxVideoPreview = json['max-video-preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['follow'] = this.follow;
    data['max-snippet'] = this.maxSnippet;
    data['max-image-preview'] = this.maxImagePreview;
    data['max-video-preview'] = this.maxVideoPreview;
    return data;
  }
}

class OgImage {
  int? width;
  int? height;
  String? url;
  String? type;

  OgImage({this.width, this.height, this.url, this.type});

  OgImage.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['type'] = this.type;
    return data;
  }
}

class TwitterMisc {
  String? writtenBy;
  String? estReadingTime;

  TwitterMisc({this.writtenBy, this.estReadingTime});

  TwitterMisc.fromJson(Map<String, dynamic> json) {
    writtenBy = json['Written by'];
    estReadingTime = json['Est. reading time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Written by'] = this.writtenBy;
    data['Est. reading time'] = this.estReadingTime;
    return data;
  }
}

class Schema {
  String? context;
  List<Graph>? graph;

  Schema({this.context, this.graph});

  Schema.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    if (json['@graph'] != null) {
      graph = <Graph>[];
      json['@graph'].forEach((v) {
        graph!.add(new Graph.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    if (this.graph != null) {
      data['@graph'] = this.graph!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Graph {
  String? type;
  String? id;
  IsPartOf? isPartOf;
  Author? author;
  String? headline;
  String? datePublished;
  String? dateModified;
  IsPartOf? mainEntityOfPage;
  int? wordCount;
  int? commentCount;
  IsPartOf? publisher;
  Image? image;
  String? thumbnailUrl;
  String? inLanguage;
  List<PotentialAction>? potentialAction;
  String? url;
  String? name;
  IsPartOf? primaryImageOfPage;
  IsPartOf? breadcrumb;
  String? contentUrl;
  int? width;
  int? height;
  String? caption;
  List<ItemListElement>? itemListElement;
  String? description;
  Logo? logo;
  List<String>? sameAs;

  Graph(
      {this.type,
        this.id,
        this.isPartOf,
        this.author,
        this.headline,
        this.datePublished,
        this.dateModified,
        this.mainEntityOfPage,
        this.wordCount,
        this.commentCount,
        this.publisher,
        this.image,
        this.thumbnailUrl,
        this.inLanguage,
        this.potentialAction,
        this.url,
        this.name,
        this.primaryImageOfPage,
        this.breadcrumb,
        this.contentUrl,
        this.width,
        this.height,
        this.caption,
        this.itemListElement,
        this.description,
        this.logo,
        this.sameAs});

  Graph.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    id = json['@id'];
    isPartOf = json['isPartOf'] != null
        ? new IsPartOf.fromJson(json['isPartOf'])
        : null;
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    headline = json['headline'];
    datePublished = json['datePublished'];
    dateModified = json['dateModified'];
    mainEntityOfPage = json['mainEntityOfPage'] != null
        ? new IsPartOf.fromJson(json['mainEntityOfPage'])
        : null;
    wordCount = json['wordCount'];
    commentCount = json['commentCount'];
    publisher = json['publisher'] != null
        ? new IsPartOf.fromJson(json['publisher'])
        : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    thumbnailUrl = json['thumbnailUrl'];
    inLanguage = json['inLanguage'];
    if (json['potentialAction'] != null) {
      potentialAction = <PotentialAction>[];
      json['potentialAction'].forEach((v) {
        potentialAction!.add(new PotentialAction.fromJson(v));
      });
    }
    url = json['url'];
    name = json['name'];
    primaryImageOfPage = json['primaryImageOfPage'] != null
        ? new IsPartOf.fromJson(json['primaryImageOfPage'])
        : null;
    breadcrumb = json['breadcrumb'] != null
        ? new IsPartOf.fromJson(json['breadcrumb'])
        : null;
    contentUrl = json['contentUrl'];
    width = json['width'];
    height = json['height'];
    caption = json['caption'];
    if (json['itemListElement'] != null) {
      itemListElement = <ItemListElement>[];
      json['itemListElement'].forEach((v) {
        itemListElement!.add(new ItemListElement.fromJson(v));
      });
    }
    description = json['description'];
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    sameAs = json['sameAs'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['@id'] = this.id;
    if (this.isPartOf != null) {
      data['isPartOf'] = this.isPartOf!.toJson();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['headline'] = this.headline;
    data['datePublished'] = this.datePublished;
    data['dateModified'] = this.dateModified;
    if (this.mainEntityOfPage != null) {
      data['mainEntityOfPage'] = this.mainEntityOfPage!.toJson();
    }
    data['wordCount'] = this.wordCount;
    data['commentCount'] = this.commentCount;
    if (this.publisher != null) {
      data['publisher'] = this.publisher!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['inLanguage'] = this.inLanguage;
    if (this.potentialAction != null) {
      data['potentialAction'] =
          this.potentialAction!.map((v) => v.toJson()).toList();
    }
    data['url'] = this.url;
    data['name'] = this.name;
    if (this.primaryImageOfPage != null) {
      data['primaryImageOfPage'] = this.primaryImageOfPage!.toJson();
    }
    if (this.breadcrumb != null) {
      data['breadcrumb'] = this.breadcrumb!.toJson();
    }
    data['contentUrl'] = this.contentUrl;
    data['width'] = this.width;
    data['height'] = this.height;
    data['caption'] = this.caption;
    if (this.itemListElement != null) {
      data['itemListElement'] =
          this.itemListElement!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    data['sameAs'] = this.sameAs;
    return data;
  }
}

class IsPartOf {
  String? id;

  IsPartOf({this.id});

  IsPartOf.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    return data;
  }
}

class Author {
  String? name;
  String? id;

  Author({this.name, this.id});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['@id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['@id'] = this.id;
    return data;
  }
}

class Image {
  String? id;
  String? type;
  String? inLanguage;
  String? url;
  String? contentUrl;
  String? caption;

  Image(
      {this.id,
        this.type,
        this.inLanguage,
        this.url,
        this.contentUrl,
        this.caption});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    inLanguage = json['inLanguage'];
    url = json['url'];
    contentUrl = json['contentUrl'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['inLanguage'] = this.inLanguage;
    data['url'] = this.url;
    data['contentUrl'] = this.contentUrl;
    data['caption'] = this.caption;
    return data;
  }
}

class PotentialAction {
  String? type;
  String? name;
  List<String>? target;
  QueryInput? queryInput;

  PotentialAction({this.type, this.name, this.target, this.queryInput});

  PotentialAction.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    name = json['name'];
    target = json['target'].cast<String>();
    queryInput = json['query-input'] != null
        ? new QueryInput.fromJson(json['query-input'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['name'] = this.name;
    data['target'] = this.target;
    if (this.queryInput != null) {
      data['query-input'] = this.queryInput!.toJson();
    }
    return data;
  }
}

class QueryInput {
  String? type;
  bool? valueRequired;
  String? valueName;

  QueryInput({this.type, this.valueRequired, this.valueName});

  QueryInput.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    valueRequired = json['valueRequired'];
    valueName = json['valueName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['valueRequired'] = this.valueRequired;
    data['valueName'] = this.valueName;
    return data;
  }
}

class ItemListElement {
  String? type;
  int? position;
  String? name;
  String? item;

  ItemListElement({this.type, this.position, this.name, this.item});

  ItemListElement.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    position = json['position'];
    name = json['name'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['position'] = this.position;
    data['name'] = this.name;
    data['item'] = this.item;
    return data;
  }
}

class Logo {
  String? type;
  String? inLanguage;
  String? id;
  String? url;
  String? contentUrl;
  int? width;
  int? height;
  String? caption;

  Logo(
      {this.type,
        this.inLanguage,
        this.id,
        this.url,
        this.contentUrl,
        this.width,
        this.height,
        this.caption});

  Logo.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    inLanguage = json['inLanguage'];
    id = json['@id'];
    url = json['url'];
    contentUrl = json['contentUrl'];
    width = json['width'];
    height = json['height'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['inLanguage'] = this.inLanguage;
    data['@id'] = this.id;
    data['url'] = this.url;
    data['contentUrl'] = this.contentUrl;
    data['width'] = this.width;
    data['height'] = this.height;
    data['caption'] = this.caption;
    return data;
  }
}

class UserIP {
  String? ip8085247161;
  String? ip80852455;
  String? ip91201115242;

  UserIP({this.ip8085247161, this.ip80852455, this.ip91201115242});

  UserIP.fromJson(Map<String, dynamic> json) {
    ip8085247161 = json['ip-80.85.247.161'];
    ip80852455 = json['ip-80.85.245.5'];
    ip91201115242 = json['ip-91.201.115.242'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip-80.85.247.161'] = this.ip8085247161;
    data['ip-80.85.245.5'] = this.ip80852455;
    data['ip-91.201.115.242'] = this.ip91201115242;
    return data;
  }
}

// class Links {
//   List<Self>? self;
//   List<Collection>? collection;
//   List<About>? about;
//   List<Author>? author;
//   List<Replies>? replies;
//   List<VersionHistory>? versionHistory;
//   List<PredecessorVersion>? predecessorVersion;
//   List<WpFeaturedmedia>? wpFeaturedmedia;
//   List<WpAttachment>? wpAttachment;
//   List<Curies>? curies;
//
//   Links(
//       {this.self,
//         this.collection,
//         this.about,
//         this.author,
//         this.replies,
//         this.versionHistory,
//         this.predecessorVersion,
//         this.wpFeaturedmedia,
//         this.wpAttachment,
//         this.curies});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     if (json['self'] != null) {
//       self = <Self>[];
//       json['self'].forEach((v) {
//         self!.add(new Self.fromJson(v));
//       });
//     }
//     if (json['collection'] != null) {
//       collection = <Collection>[];
//       json['collection'].forEach((v) {
//         collection!.add(new Collection.fromJson(v));
//       });
//     }
//     if (json['about'] != null) {
//       about = <About>[];
//       json['about'].forEach((v) {
//         about!.add(new About.fromJson(v));
//       });
//     }
//     if (json['author'] != null) {
//       author = <Author>[];
//       json['author'].forEach((v) {
//         author!.add(new Author.fromJson(v));
//       });
//     }
//     if (json['replies'] != null) {
//       replies = <Replies>[];
//       json['replies'].forEach((v) {
//         replies!.add(new Replies.fromJson(v));
//       });
//     }
//     if (json['version-history'] != null) {
//       versionHistory = <VersionHistory>[];
//       json['version-history'].forEach((v) {
//         versionHistory!.add(new VersionHistory.fromJson(v));
//       });
//     }
//     if (json['predecessor-version'] != null) {
//       predecessorVersion = <PredecessorVersion>[];
//       json['predecessor-version'].forEach((v) {
//         predecessorVersion!.add(new PredecessorVersion.fromJson(v));
//       });
//     }
//     if (json['wp:featuredmedia'] != null) {
//       wpFeaturedmedia = <WpFeaturedmedia>[];
//       json['wp:featuredmedia'].forEach((v) {
//         wpFeaturedmedia!.add(new WpFeaturedmedia.fromJson(v));
//       });
//     }
//     if (json['wp:attachment'] != null) {
//       wpAttachment = <WpAttachment>[];
//       json['wp:attachment'].forEach((v) {
//         wpAttachment!.add(new WpAttachment.fromJson(v));
//       });
//     }
//     if (json['curies'] != null) {
//       curies = <Curies>[];
//       json['curies'].forEach((v) {
//         curies!.add(new Curies.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.self != null) {
//       data['self'] = this.self!.map((v) => v.toJson()).toList();
//     }
//     if (this.collection != null) {
//       data['collection'] = this.collection!.map((v) => v.toJson()).toList();
//     }
//     if (this.about != null) {
//       data['about'] = this.about!.map((v) => v.toJson()).toList();
//     }
//     if (this.author != null) {
//       data['author'] = this.author!.map((v) => v.toJson()).toList();
//     }
//     if (this.replies != null) {
//       data['replies'] = this.replies!.map((v) => v.toJson()).toList();
//     }
//     if (this.versionHistory != null) {
//       data['version-history'] =
//           this.versionHistory!.map((v) => v.toJson()).toList();
//     }
//     if (this.predecessorVersion != null) {
//       data['predecessor-version'] =
//           this.predecessorVersion!.map((v) => v.toJson()).toList();
//     }
//     if (this.wpFeaturedmedia != null) {
//       data['wp:featuredmedia'] =
//           this.wpFeaturedmedia!.map((v) => v.toJson()).toList();
//     }
//     if (this.wpAttachment != null) {
//       data['wp:attachment'] =
//           this.wpAttachment!.map((v) => v.toJson()).toList();
//     }
//     if (this.curies != null) {
//       data['curies'] = this.curies!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Self {
  String? href;
  TargetHints? targetHints;

  Self({this.href, this.targetHints});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    targetHints = json['targetHints'] != null
        ? new TargetHints.fromJson(json['targetHints'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.targetHints != null) {
      data['targetHints'] = this.targetHints!.toJson();
    }
    return data;
  }
}

class TargetHints {
  List<String>? allow;

  TargetHints({this.allow});

  TargetHints.fromJson(Map<String, dynamic> json) {
    allow = json['allow'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow'] = this.allow;
    return data;
  }
}

class Collection {
  String? href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

// class Author {
//   bool? embeddable;
//   String? href;
//
//   Author({this.embeddable, this.href});
//
//   Author.fromJson(Map<String, dynamic> json) {
//     embeddable = json['embeddable'];
//     href = json['href'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['embeddable'] = this.embeddable;
//     data['href'] = this.href;
//     return data;
//   }
// }

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['href'] = this.href;
    return data;
  }
}

class PredecessorVersion {
  int? id;
  String? href;

  PredecessorVersion({this.id, this.href});

  PredecessorVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['href'] = this.href;
    return data;
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['href'] = this.href;
    data['templated'] = this.templated;
    return data;
  }
}














































