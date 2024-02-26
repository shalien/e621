part of '../resource.dart';

@immutable

/// A post in the e621 API.
final class Post extends Resource {
  /// creation date of the post in ISO 8601 format
  final String createdAt;

  /// last update date of the post in ISO 8601 format
  final String updatedAt;

  /// Meta of the image
  final _File file;

  /// The sample of the image
  final _Preview preview;

  /// The sample of the image
  final _Sample sample;

  /// The score of the post
  final _Score score;

  /// The tags of the post
  final _Tags tags;

  /// The locked tags of the post
  final List<String> lockedTags;

  /// An ID that increases for every post alteration on E6
  final int changeSeq;

  /// The flags of the post
  final _Flags flags;

  /// The rating of the post
  final String rating;

  /// The number of favorites of the post
  final int favCount;

  /// The sources of the post
  final List<String> sources;

  /// The Pools of the post
  final List<int> pools;

  /// The relationships of the post
  final _Relationship relationships;

  /// The approver ID of the post
  final int? approverId;

  /// The uploader ID of the post
  final int uploaderId;

  /// The description of the post
  final String description;

  /// The comment count of the post
  final int commentCount;

  /// If provided auth credentials, will return if the authenticated user has favorited the post or not.
  final bool isFavorited;

  @internal
  Post(
      {required super.id,
      required this.createdAt,
      required this.updatedAt,
      required int fileWidth,
      required int fileHeight,
      required String fileExt,
      required int fileSize,
      required String fileMd5,
      required Uri? fileUrl,
      required int previewWidth,
      required int previewHeight,
      required Uri? previewUrl,
      required bool sampleHas,
      required int sampleWidth,
      required int sampleHeight,
      required Uri? sampleUrl,
      required int scoreUp,
      required int scoreDown,
      required int scoreTotal,
      required List<String> tagsGeneral,
      required List<String> tagsSpecies,
      required List<String> tagsCharacter,
      required List<String> tagsArtist,
      required List<String> tagsInvalid,
      required List<String> tagsLore,
      required List<String> tagsMeta,
      required this.changeSeq,
      required this.lockedTags,
      required bool flagsPending,
      required bool flagsFlagged,
      required bool flagsNoteLocked,
      required bool flagsStatusLocked,
      required bool flagsRatingLocked,
      required bool flagsDeleted,
      required this.rating,
      required this.favCount,
      required this.sources,
      required this.pools,
      required int? relationshipsParentId,
      required bool relationshipsHasChildren,
      required bool relationshipsHasActiveChildren,
      required List<int> relationshipsChildren,
      required this.approverId,
      required this.uploaderId,
      required this.description,
      required this.commentCount,
      required this.isFavorited})
      : file = _File(
            width: fileWidth,
            height: fileHeight,
            ext: fileExt,
            size: fileSize,
            md5: fileMd5,
            url: fileUrl),
        preview = _Preview(
            width: previewWidth, height: previewHeight, url: previewUrl),
        sample = _Sample(
            has: sampleHas,
            width: sampleWidth,
            height: sampleHeight,
            url: sampleUrl),
        score = _Score(up: scoreUp, down: scoreDown, total: scoreTotal),
        tags = _Tags(
            general: tagsGeneral,
            species: tagsSpecies,
            character: tagsCharacter,
            artist: tagsArtist,
            invalid: tagsInvalid,
            lore: tagsLore,
            meta: tagsMeta),
        flags = _Flags(
          pending: flagsPending,
          flagged: flagsFlagged,
          noteLocked: flagsNoteLocked,
          statusLocked: flagsStatusLocked,
          ratingLocked: flagsRatingLocked,
          deleted: flagsDeleted,
        ),
        relationships = _Relationship(
            parentId: relationshipsParentId,
            hasChildren: relationshipsHasChildren,
            hasActiveChildren: relationshipsHasActiveChildren,
            children: relationshipsChildren);

  @override
  @mustCallSuper
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Post) return false;
    return other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.file == file &&
        other.preview == preview &&
        other.sample == sample &&
        other.score == score &&
        other.tags == tags &&
        other.lockedTags == lockedTags &&
        other.changeSeq == changeSeq &&
        other.flags == flags &&
        other.rating == rating &&
        other.favCount == favCount &&
        other.sources == sources &&
        other.pools == pools &&
        other.relationships == relationships &&
        other.approverId == approverId &&
        other.uploaderId == uploaderId &&
        other.description == description &&
        other.commentCount == commentCount &&
        other.isFavorited == isFavorited;
  }

  @override
  Post copyWith(
      {String? createdAt,
      String? updatedAt,
      int? fileWidth,
      int? fileHeight,
      String? fileExt,
      int? fileSize,
      String? fileMd5,
      Uri? fileUrl,
      int? previewWidth,
      int? previewHeight,
      Uri? previewUrl,
      bool? sampleHas,
      int? sampleWidth,
      int? sampleHeight,
      Uri? sampleUrl,
      int? scoreUp,
      int? scoreDown,
      int? scoreTotal,
      List<String>? tagsGeneral,
      List<String>? tagsSpecies,
      List<String>? tagsCharacter,
      List<String>? tagsArtist,
      List<String>? tagsInvalid,
      List<String>? tagsLore,
      List<String>? tagsMeta,
      int? changeSeq,
      List<String>? lockedTags,
      bool? flagsPending,
      bool? flagsFlagged,
      bool? flagsNoteLocked,
      bool? flagsStatusLocked,
      bool? flagsRatingLocked,
      bool? flagsDeleted,
      String? rating,
      int? favCount,
      List<String>? sources,
      List<int>? pools,
      int? relationshipsParentId,
      bool? relationshipsHasChildren,
      bool? relationshipsHasActiveChildren,
      List<int>? relationshipsChildren,
      int? approverId,
      int? uploaderId,
      String? description,
      int? commentCount,
      bool? isFavorited}) {
    return Post(
        id: id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        fileWidth: fileWidth ?? file.width,
        fileHeight: fileHeight ?? file.height,
        fileExt: fileExt ?? file.ext,
        fileSize: fileSize ?? file.size,
        fileMd5: fileMd5 ?? file.md5,
        fileUrl: fileUrl ?? file.url,
        previewWidth: previewWidth ?? preview.width,
        previewHeight: previewHeight ?? preview.height,
        previewUrl: previewUrl ?? preview.url,
        sampleHas: sampleHas ?? sample.has,
        sampleWidth: sampleWidth ?? sample.width,
        sampleHeight: sampleHeight ?? sample.height,
        sampleUrl: sampleUrl ?? sample.url,
        scoreUp: scoreUp ?? score.up,
        scoreDown: scoreDown ?? score.down,
        scoreTotal: scoreTotal ?? score.total,
        tagsGeneral: tagsGeneral ?? tags.general,
        tagsSpecies: tagsSpecies ?? tags.species,
        tagsCharacter: tagsCharacter ?? tags.character,
        tagsArtist: tagsArtist ?? tags.artist,
        tagsInvalid: tagsInvalid ?? tags.invalid,
        tagsLore: tagsLore ?? tags.lore,
        tagsMeta: tagsMeta ?? tags.meta,
        changeSeq: changeSeq ?? this.changeSeq,
        lockedTags: lockedTags ?? this.lockedTags,
        flagsPending: flagsPending ?? flags.pending,
        flagsFlagged: flagsFlagged ?? flags.flagged,
        flagsNoteLocked: flagsNoteLocked ?? flags.noteLocked,
        flagsStatusLocked: flagsStatusLocked ?? flags.statusLocked,
        flagsRatingLocked: flagsRatingLocked ?? flags.ratingLocked,
        flagsDeleted: flagsDeleted ?? flags.deleted,
        rating: rating ?? this.rating,
        favCount: favCount ?? this.favCount,
        sources: sources ?? this.sources,
        pools: pools ?? this.pools,
        relationshipsParentId: relationshipsParentId ?? relationships.parentId,
        relationshipsHasChildren:
            relationshipsHasChildren ?? relationships.hasChildren,
        relationshipsHasActiveChildren:
            relationshipsHasActiveChildren ?? relationships.hasActiveChildren,
        relationshipsChildren: relationshipsChildren ?? relationships.children,
        approverId: approverId ?? this.approverId,
        uploaderId: uploaderId ?? this.uploaderId,
        description: description ?? this.description,
        commentCount: commentCount ?? this.commentCount,
        isFavorited: isFavorited ?? this.isFavorited);
  }

  @override
  @internal
  Post.fromMap(super.map)
      : createdAt = map['created_at'],
        updatedAt = map['updated_at'],
        file = _File.fromJson(map['file']),
        preview = _Preview.fromJson(map['preview']),
        sample = _Sample.fromJson(map['sample']),
        score = _Score.fromJson(map['score']),
        tags = _Tags.fromJson(map['tags']),
        lockedTags = List<String>.from(map['locked_tags']),
        changeSeq = map['change_seq'],
        flags = _Flags.fromJson(map['flags']),
        rating = map['rating'],
        favCount = map['fav_count'],
        sources = List<String>.from(map['sources']),
        pools = List<int>.from(map['pools']),
        relationships = _Relationship.fromJson(map['relationships']),
        approverId = map['approver_id'],
        uploaderId = map['uploader_id'],
        description = map['description'],
        commentCount = map['comment_count'],
        isFavorited = map['is_favorited'],
        super._fromMap();

  @override
  @mustCallSuper
  int get hashCode =>
      super.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      file.hashCode ^
      preview.hashCode ^
      sample.hashCode ^
      score.hashCode ^
      tags.hashCode ^
      lockedTags.hashCode ^
      changeSeq.hashCode ^
      flags.hashCode ^
      rating.hashCode ^
      favCount.hashCode ^
      sources.hashCode ^
      pools.hashCode ^
      relationships.hashCode ^
      approverId.hashCode ^
      uploaderId.hashCode ^
      description.hashCode ^
      commentCount.hashCode ^
      isFavorited.hashCode;

  @override
  @mustCallSuper
  String toString() {
    return super.toString();
  }
}

/// A File subpart of a post.
final class _File {
  /// The width of the file in pixels.
  final int width;

  /// The height of the file in pixels.
  final int height;

  /// The file extension.
  final String ext;

  /// The file size in bytes.
  final int size;

  /// The MD5 hash of the file.
  final String md5;

  /// The URL of the file.
  final Uri? url;

  /// Creates a new file.
  const _File(
      {required this.width,
      required this.height,
      required this.ext,
      required this.size,
      required this.md5,
      required this.url});

  /// Creates a file from a map.
  factory _File.fromJson(Map<String, dynamic> json) {
    return _File(
        width: json['width'],
        height: json['height'],
        ext: json['ext'],
        size: json['size'],
        md5: json['md5'],
        url: json['url'] == null ? null : Uri.tryParse(json['url']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! _File) return false;
    return other.width == width &&
        other.height == height &&
        other.ext == ext &&
        other.size == size &&
        other.md5 == md5 &&
        other.url == url;
  }

  @override
  int get hashCode =>
      width.hashCode ^
      height.hashCode ^
      ext.hashCode ^
      size.hashCode ^
      md5.hashCode ^
      url.hashCode;
}

/// A Preview subpart of a post.
final class _Preview {
  /// The width of the preview in pixels.
  final int width;

  /// The height of the preview in pixels.
  final int height;

  /// The URL of the preview.
  final Uri? url;

  /// Creates a new preview.
  const _Preview(
      {required this.width, required this.height, required this.url});

  /// Creates a preview from a map.
  factory _Preview.fromJson(Map<String, dynamic> json) {
    return _Preview(
        width: json['width'],
        height: json['height'],
        url: json['url'] == null ? null : Uri.tryParse(json['url']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! _Preview) return false;
    return other.width == width && other.height == height && other.url == url;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ url.hashCode;
}

/// A Sample subpart of a post.
final class _Sample {
  /// does the sample exist
  final bool has;

  /// The width of the sample in pixels.
  final int width;

  /// The height of the sample in pixels.
  final int height;

  /// The URL of the sample.
  final Uri? url;

  /// Creates a new sample.
  const _Sample(
      {required this.has,
      required this.width,
      required this.height,
      required this.url});

  /// Creates a sample from a map.
  factory _Sample.fromJson(Map<String, dynamic> json) {
    return _Sample(
        has: json['has'],
        width: json['width'],
        height: json['height'],
        url: json['url'] == null ? null : Uri.tryParse(json['url']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! _Sample) return false;
    return other.has == has &&
        other.width == width &&
        other.height == height &&
        other.url == url;
  }

  @override
  int get hashCode =>
      has.hashCode ^ width.hashCode ^ height.hashCode ^ url.hashCode;
}

/// A Score subpart of a post.
final class _Score {
  /// The number of upvotes.
  final int up;

  /// The number of downvotes.
  final int down;

  /// The total score.
  final int total;

  /// Creates a new score.
  const _Score({required this.up, required this.down, required this.total});

  /// Creates a score from a map.
  factory _Score.fromJson(Map<String, dynamic> json) {
    return _Score(up: json['up'], down: json['down'], total: json['total']);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! _Score) return false;
    return other.up == up && other.down == down && other.total == total;
  }

  @override
  int get hashCode => up.hashCode ^ down.hashCode ^ total.hashCode;
}

/// The tags of a post.
final class _Tags {
  /// The general tags of the post.
  final List<String> general;

  /// The species tags of the post.
  final List<String> species;

  /// The character tags of the post.
  final List<String> character;

  /// The artist tags of the post.
  final List<String> artist;

  /// The invalid tags of the post.
  final List<String> invalid;

  /// The lore tags of the post.
  final List<String> lore;

  /// The meta tags of the post.
  final List<String> meta;

  const _Tags(
      {required this.general,
      required this.species,
      required this.character,
      required this.artist,
      required this.invalid,
      required this.lore,
      required this.meta});

  factory _Tags.fromJson(Map<String, dynamic> json) {
    return _Tags(
        general: List<String>.from(json['general']),
        species: List<String>.from(json['species']),
        character: List<String>.from(json['character']),
        artist: List<String>.from(json['artist']),
        invalid: List<String>.from(json['invalid']),
        lore: List<String>.from(json['lore']),
        meta: List<String>.from(json['meta']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! _Tags) return false;
    return other.general == general &&
        other.species == species &&
        other.character == character &&
        other.artist == artist &&
        other.invalid == invalid &&
        other.lore == lore &&
        other.meta == meta;
  }

  @override
  int get hashCode =>
      general.hashCode ^
      species.hashCode ^
      character.hashCode ^
      artist.hashCode ^
      invalid.hashCode ^
      lore.hashCode ^
      meta.hashCode;
}

/// The flags of a post.
final class _Flags {
  /// is the post pending
  final bool pending;

  /// is the post flagged
  final bool flagged;

  /// is the note locked
  final bool noteLocked;

  /// is the status locked
  final bool statusLocked;

  /// is the rating locked
  final bool ratingLocked;

  /// is the post deleted
  final bool deleted;

  /// Creates a new flags.
  const _Flags({
    required this.pending,
    required this.flagged,
    required this.noteLocked,
    required this.statusLocked,
    required this.ratingLocked,
    required this.deleted,
  });

  /// Creates a flags from a map.
  factory _Flags.fromJson(Map<String, dynamic> json) {
    return _Flags(
      pending: json['pending'],
      flagged: json['flagged'],
      noteLocked: json['note_locked'],
      statusLocked: json['status_locked'],
      ratingLocked: json['rating_locked'],
      deleted: json['deleted'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! _Flags) return false;
    return other.pending == pending &&
        other.flagged == flagged &&
        other.noteLocked == noteLocked &&
        other.statusLocked == statusLocked &&
        other.ratingLocked == ratingLocked &&
        other.deleted == deleted;
  }

  @override
  int get hashCode =>
      pending.hashCode ^
      flagged.hashCode ^
      noteLocked.hashCode ^
      statusLocked.hashCode ^
      ratingLocked.hashCode ^
      deleted.hashCode;
}

/// The relationships of a post.
final class _Relationship {
  /// The ID of the parent post.
  final int? parentId;

  /// does the post have children
  final bool hasChildren;

  /// does the post have active children
  final bool hasActiveChildren;

  /// The IDs of the children posts.
  final List<int> children;

  /// Creates a new relationship.
  const _Relationship(
      {required this.parentId,
      required this.hasChildren,
      required this.hasActiveChildren,
      required this.children});

  /// Creates a relationship from a map.
  factory _Relationship.fromJson(Map<String, dynamic> json) {
    return _Relationship(
        parentId: json['parent_id'],
        hasChildren: json['has_children'],
        hasActiveChildren: json['has_active_children'],
        children: List<int>.from(json['children']));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! _Relationship) return false;
    return other.parentId == parentId &&
        other.hasChildren == hasChildren &&
        other.hasActiveChildren == hasActiveChildren &&
        other.children == children;
  }

  @override
  int get hashCode =>
      parentId.hashCode ^
      hasChildren.hashCode ^
      hasActiveChildren.hashCode ^
      children.hashCode;
}
