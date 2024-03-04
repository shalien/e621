part of '../resource.dart';

@immutable

/// A post in the e621 API.
final class Post extends Resource {
  /// creation date of the post in ISO 8601 format
  final String createdAt;

  /// last update date of the post in ISO 8601 format
  final String updatedAt;

  /// Meta of the image
  final File file;

  /// The sample of the image
  final Preview preview;

  /// The sample of the image
  final Sample sample;

  /// The score of the post
  final Score score;

  /// The tags of the post
  final Tags tags;

  /// The locked tags of the post
  final List<String> lockedTags;

  /// An ID that increases for every post alteration on E6
  final int changeSeq;

  /// The flags of the post
  final Flags flags;

  /// The rating of the post
  final String rating;

  /// The number of favorites of the post
  final int favCount;

  /// The sources of the post
  final List<String> sources;

  /// The Pools of the post
  final List<int> pools;

  /// The relationships of the post
  final Relationship relationships;

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
      : file = File(
            width: fileWidth,
            height: fileHeight,
            ext: fileExt,
            size: fileSize,
            md5: fileMd5,
            url: fileUrl),
        preview = Preview(
            width: previewWidth, height: previewHeight, url: previewUrl),
        sample = Sample(
            has: sampleHas,
            width: sampleWidth,
            height: sampleHeight,
            url: sampleUrl),
        score = Score(up: scoreUp, down: scoreDown, total: scoreTotal),
        tags = Tags(
            general: tagsGeneral,
            species: tagsSpecies,
            character: tagsCharacter,
            artist: tagsArtist,
            invalid: tagsInvalid,
            lore: tagsLore,
            meta: tagsMeta),
        flags = Flags(
          pending: flagsPending,
          flagged: flagsFlagged,
          noteLocked: flagsNoteLocked,
          statusLocked: flagsStatusLocked,
          ratingLocked: flagsRatingLocked,
          deleted: flagsDeleted,
        ),
        relationships = Relationship(
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
        file = File.fromJson(map['file']),
        preview = Preview.fromJson(map['preview']),
        sample = Sample.fromJson(map['sample']),
        score = Score.fromJson(map['score']),
        tags = Tags.fromJson(map['tags']),
        lockedTags = List<String>.from(map['locked_tags']),
        changeSeq = map['change_seq'],
        flags = Flags.fromJson(map['flags']),
        rating = map['rating'],
        favCount = map['fav_count'],
        sources = List<String>.from(map['sources']),
        pools = List<int>.from(map['pools']),
        relationships = Relationship.fromJson(map['relationships']),
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
