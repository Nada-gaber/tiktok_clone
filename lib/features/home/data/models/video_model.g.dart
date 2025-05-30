// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixabayResponse _$PixabayResponseFromJson(Map<String, dynamic> json) =>
    PixabayResponse(
      total: (json['total'] as num?)?.toInt(),
      totalHits: (json['totalHits'] as num?)?.toInt(),
      hits: (json['hits'] as List<dynamic>?)
          ?.map((e) => Hit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PixabayResponseToJson(PixabayResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };

Hit _$HitFromJson(Map<String, dynamic> json) => Hit(
      videos: json['videos'] == null
          ? null
          : VideoQualities.fromJson(json['videos'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      pageURL: json['pageURL'] as String?,
      type: json['type'] as String?,
      tags: json['tags'] as String?,
      previewURL: json['previewURL'] as String?,
      previewWidth: (json['previewWidth'] as num?)?.toInt(),
      previewHeight: (json['previewHeight'] as num?)?.toInt(),
      webformatURL: json['webformatURL'] as String?,
      webformatWidth: (json['webformatWidth'] as num?)?.toInt(),
      webformatHeight: (json['webformatHeight'] as num?)?.toInt(),
      largeImageURL: json['largeImageURL'] as String?,
      fullHDURL: json['fullHDURL'] as String?,
      imageURL: json['imageURL'] as String?,
      imageWidth: (json['imageWidth'] as num?)?.toInt(),
      imageHeight: (json['imageHeight'] as num?)?.toInt(),
      imageSize: (json['imageSize'] as num?)?.toInt(),
      views: (json['views'] as num?)?.toInt(),
      downloads: (json['downloads'] as num?)?.toInt(),
      likes: (json['likes'] as num?)?.toInt(),
      comments: (json['comments'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      user: json['user'] as String?,
      userImageURL: json['userImageURL'] as String?,
    );

Map<String, dynamic> _$HitToJson(Hit instance) => <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageURL,
      'type': instance.type,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'fullHDURL': instance.fullHDURL,
      'imageURL': instance.imageURL,
      'videos': instance.videos,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.userId,
      'user': instance.user,
      'userImageURL': instance.userImageURL,
    };

VideoQualities _$VideoQualitiesFromJson(Map<String, dynamic> json) =>
    VideoQualities(
      large: json['large'] == null
          ? null
          : VideoFile.fromJson(json['large'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : VideoFile.fromJson(json['medium'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : VideoFile.fromJson(json['small'] as Map<String, dynamic>),
      tiny: json['tiny'] == null
          ? null
          : VideoFile.fromJson(json['tiny'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoQualitiesToJson(VideoQualities instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'tiny': instance.tiny,
    };

VideoFile _$VideoFileFromJson(Map<String, dynamic> json) => VideoFile(
      url: json['url'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$VideoFileToJson(VideoFile instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'thumbnail': instance.thumbnail,
    };
