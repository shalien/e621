part of '../data_access_object.dart';

/// A data access object for pools.
final class PoolDataAccessObject extends DataAccessObject<Pool> {
  /// Creates a new pool data access object.
  const PoolDataAccessObject(E621Client client) : super(client, 'pools');

  /// Returns a list of pools.
  /// [nameMatches] Search pool name.
  /// [id] Search for a pool ID, you can search for multiple IDs at once.
  /// [description] Search pool description.
  /// [creatorName] Search for pools based on creator name.
  /// [creatorId] Search for pools based on creator ID.
  /// [isActive] If the pool is active or hidden.
  /// [category] The category of the pool. Can either be “[PoolCategory.series]” or “[PoolCategory.collection]”
  /// [order] The [PoolOrder] that pools should be returned, can be any of: [PoolOrder.name], [PoolOrder.createdAt], [PoolOrder.updatedAt], [PoolOrder.postCount]. If not specified it orders by [PoolOrder.updatedAt].
  /// [limit] The limit of how many pools should be retrieved.
  Future<List<Pool>> list({
    String? nameMatches,
    List<int>? id,
    String? descriptionMatches,
    String? creatorName,
    int? creatorId,
    bool? isActive,
    PoolCategory? category,
    PoolOrder? order = PoolOrder.updatedAt,
    int? limit,
  }) async {
    /// every parameters should be encased in search[] except limit
    final Map<String, String> queryParameters = {
      ...(nameMatches != null ? {'search[name_matches]': nameMatches} : {}),
      ...(id != null ? {'search[id]': id.join(',').toString()} : {}),
      ...(descriptionMatches != null
          ? {'search[description_matches]': descriptionMatches}
          : {}),
      ...(creatorName != null ? {'search[creator_name]': creatorName} : {}),
      ...(creatorId != null
          ? {'search[creator_id]': creatorId.toString()}
          : {}),
      ...(isActive != null ? {'search[is_active]': isActive.toString()} : {}),
      ...(category != null ? {'search[category]': category.toString()} : {}),
      ...(order != null ? {'order': order.toString()} : {}),
      ...(limit != null ? {'limit': limit.toString()} : {}),
    };

    final Uri uri = Uri.https(
      host,
      '$_endpoint.json',
      queryParameters,
    );

    final Response response;

    try {
      response = await client.get(uri);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.ok) {
      throw E621Exception.fromResponse(json.decode(response.body));
    }

    List<dynamic>? maps;

    try {
      maps = json.decode(response.body);
    } on TypeError catch (_) {
      rethrow;
    }

    if (maps == null) {
      return [];
    }

    return maps.map((e) => fromJson(e)).toList();
  }

  /// Returns a pool.
  /// [name] - The name of the pool.
  /// [description] - The description of the pool.
  /// [category] - The category of the pool. Can either be “[PoolCategory.series]” or “[PoolCategory.collection]”
  /// [isLocked] - If the pool is locked or not. Admin only function.
  Future<Pool> create({
    required String name,
    required String description,
    PoolCategory? category,
    bool? isLocked,
  }) async {
    // evey parameter should be encased in pool[]
    // is_locked should be a string but also 1 or 0
    final Map<String, dynamic> body = {
      'pool[name]': name,
      'pool[description]': description,
      ...(category != null ? {'pool[category]': category.toString()} : {}),
      ...(isLocked != null ? {'pool[is_locked]': isLocked ? '1' : '0'} : {}),
    };

    final Uri uri = Uri.https(
      host,
      '$_endpoint.json',
    );

    final Response response;

    try {
      response = await client.post(uri, body: body);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.created) {
      throw E621Exception.fromResponse(response);
    }

    return fromJson(json.decode(response.body));
  }

  /// Update the given [Pool] .
  /// Only use parameters you want to update.
  /// [id] - The ID of the pool to update.
  /// [name] - The name of the pool.
  /// [description] - The description of the pool.
  /// [category] - The category of the pool. Can either be “[PoolCategory.series]” or “[PoolCategory.collection]”
  /// [isLocked] - If the pool is locked or not.
  Future<bool> update({
    required int id,
    String? name,
    String? description,
    PoolCategory? category,
    bool? isLocked,
  }) async {
    // evey parameter should be encased in pool[]
    // is_locked should be a string but also 1 or 0
    final Map<String, dynamic> body = {
      ...(name != null ? {'pool[name]': name} : {}),
      ...(description != null ? {'pool[description]': description} : {}),
      ...(category != null ? {'pool[category]': category.toString()} : {}),
      ...(isLocked != null ? {'pool[is_locked]': isLocked ? '1' : '0'} : {}),
    };

    final Uri uri = Uri.https(
      host,
      '$_endpoint/$id.json',
    );

    final Response response;

    try {
      response = await client.put(uri, body: body);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.noContent) {
      throw E621Exception.fromResponse(response);
    }

    return true;
  }

  /// Revert a pool to [version].
  /// [id] - The ID of the pool to revert.
  /// [versionId] - The version to revert to.
  Future<bool> revert({required int id, required int versionId}) async {
    final Uri uri = Uri.https(
      host,
      '$_endpoint/$id/revert.json',
    );

    final Map<String, dynamic> body = {
      'version_id': versionId.toString(),
    };

    final Response response;

    try {
      response = await client.put(uri, body: body);
    } on ClientException catch (_) {
      rethrow;
    }

    if (response.statusCode != HttpStatus.ok) {
      throw E621Exception.fromResponse(json.decode(response.body));
    }

    return true;
  }

  @override
  Pool fromJson(Map<String, dynamic> json) {
    return Pool.fromMap(json);
  }
}
