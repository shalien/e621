part of '../resource.dart';

/// A [Note] on a [Post].
final class Note extends Resource {
  /// he time the note was created in the format of `YYYY-MM-DDTHH:MM:SS.MS+00:00`.
  final String createdAt;

  /// The time the mote was last updated in the format of `YYYY-MM-DDTHH:MM:SS.MS+00:00`.
  final String updatedAt;

  /// The ID of the user who created the note.
  final int creatorId;

  /// The X coordinate of the top left corner of the note in pixels from the top left of the post.
  final int x;

  /// The Y coordinate of the top left corner of the note in pixels from the top left of the post.
  final int y;

  /// The width of the box for the note.
  final int width;

  /// The height of the box for the note.
  final int height;

  /// How many times the note has been edited.
  final int version;

  /// Whether the note is active.
  final bool isActive;

  /// The ID of the post the note is on.
  final int postId;

  /// The contents of the note.
  final String body;

  /// The name of the user that created the note.
  final String creatorName;

  /// Creates a note.
  const Note({
    required super.id,
    required this.createdAt,
    required this.updatedAt,
    required this.creatorId,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.version,
    required this.isActive,
    required this.postId,
    required this.body,
    required this.creatorName,
  });

  /// Creates a note from a map.
  Note.fromMap(Map<String, dynamic> map)
      : createdAt = map['created_at'],
        updatedAt = map['updated_at'],
        creatorId = map['creator_id'],
        x = map['x'],
        y = map['y'],
        width = map['width'],
        height = map['height'],
        version = map['version'],
        isActive = map['is_active'],
        postId = map['post_id'],
        body = map['body'],
        creatorName = map['creator_name'],
        super(id: map['id']);

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    throw UnimplementedError();
  }

  @override
  Note copyWith({
    String? createdAt,
    String? updatedAt,
    int? creatorId,
    int? x,
    int? y,
    int? width,
    int? height,
    int? version,
    bool? isActive,
    int? postId,
    String? body,
    String? creatorName,
  }) {
    return Note(
      id: id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      creatorId: creatorId ?? this.creatorId,
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
      version: version ?? this.version,
      isActive: isActive ?? this.isActive,
      postId: postId ?? this.postId,
      body: body ?? this.body,
      creatorName: creatorName ?? this.creatorName,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      creatorId.hashCode ^
      x.hashCode ^
      y.hashCode ^
      width.hashCode ^
      height.hashCode ^
      version.hashCode ^
      isActive.hashCode ^
      postId.hashCode ^
      body.hashCode ^
      creatorName.hashCode;

  @override
  String toString() {
    return 'Note{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, creatorId: $creatorId, x: $x, y: $y, width: $width, height: $height, version: $version, isActive: $isActive, postId: $postId, body: $body, creatorName: $creatorName}';
  }
}
