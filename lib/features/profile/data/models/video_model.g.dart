// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PexelsVideoModel _$PexelsVideoModelFromJson(Map<String, dynamic> json) =>
    PexelsVideoModel(
      page: (json['page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
      url: json['url'] as String,
      videos: (json['videos'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PexelsVideoModelToJson(PexelsVideoModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'url': instance.url,
      'videos': instance.videos,
    };

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      id: (json['id'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      url: json['url'] as String,
      image: json['image'] as String,
      duration: (json['duration'] as num).toInt(),
      user: VideoUser.fromJson(json['user'] as Map<String, dynamic>),
      videoFiles: (json['video_files'] as List<dynamic>)
          .map((e) => VideoFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoPictures: (json['video_pictures'] as List<dynamic>)
          .map((e) => VideoPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'image': instance.image,
      'duration': instance.duration,
      'user': instance.user,
      'video_files': instance.videoFiles,
      'video_pictures': instance.videoPictures,
    };

VideoUser _$VideoUserFromJson(Map<String, dynamic> json) => VideoUser(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$VideoUserToJson(VideoUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };

VideoFile _$VideoFileFromJson(Map<String, dynamic> json) => VideoFile(
      id: (json['id'] as num).toInt(),
      quality: json['quality'] as String,
      fileType: json['file_type'] as String,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      link: json['link'] as String,
    );

Map<String, dynamic> _$VideoFileToJson(VideoFile instance) => <String, dynamic>{
      'id': instance.id,
      'quality': instance.quality,
      'file_type': instance.fileType,
      'width': instance.width,
      'height': instance.height,
      'link': instance.link,
    };

VideoPicture _$VideoPictureFromJson(Map<String, dynamic> json) => VideoPicture(
      id: (json['id'] as num).toInt(),
      picture: json['picture'] as String,
      nr: (json['nr'] as num).toInt(),
    );

Map<String, dynamic> _$VideoPictureToJson(VideoPicture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'picture': instance.picture,
      'nr': instance.nr,
    };
