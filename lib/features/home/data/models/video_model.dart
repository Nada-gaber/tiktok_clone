import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';


@JsonSerializable()
class PixabayResponse {
  final int? total;
  final int? totalHits;
  final List<Hit>? hits;

  PixabayResponse({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  factory PixabayResponse.fromJson(Map<String, dynamic> json) =>
      _$PixabayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayResponseToJson(this);
}



@JsonSerializable()
class Hit {
  final int? id;
  final String? pageURL;
  final String? type;
  final String? tags;
  final String? previewURL;
  final int? previewWidth;
  final int? previewHeight;
  final String? webformatURL;
  final int? webformatWidth;
  final int? webformatHeight;
  final String? largeImageURL;
  final String? fullHDURL;
  final String? imageURL;
  final VideoQualities ? videos;
  final int? imageWidth;
  final int? imageHeight;
  final int? imageSize;
  final int? views;
  final int? downloads;
  final int? likes;
  final int? comments;
  @JsonKey(name: 'user_id')
  final int? userId;
  final String? user;
  final String?userImageURL;

  Hit({
    required this.videos,
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    this.fullHDURL,
    this.imageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => _$HitFromJson(json);

  Map<String, dynamic> toJson() => _$HitToJson(this);
}

@JsonSerializable()
class VideoQualities {
  final VideoFile? large;
  final VideoFile? medium;
  final VideoFile? small;
  final VideoFile? tiny;

  VideoQualities({
    this.large,
    this.medium,
    this.small,
    this.tiny,
  });

  factory VideoQualities.fromJson(Map<String, dynamic> json) =>
      _$VideoQualitiesFromJson(json);

  Map<String, dynamic> toJson() => _$VideoQualitiesToJson(this);
}

@JsonSerializable()
class VideoFile {
  final String url;
  final int width;
  final int height;
  final int size;
  final String thumbnail;

  VideoFile({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.thumbnail,
  });

  factory VideoFile.fromJson(Map<String, dynamic> json) =>
      _$VideoFileFromJson(json);

  Map<String, dynamic> toJson() => _$VideoFileToJson(this);
}