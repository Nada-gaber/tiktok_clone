import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';


@JsonSerializable()
class PexelsVideoModel {
  final int page;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'total_results')
  final int totalResults;

  final String url;
  final List<Video> videos;

  PexelsVideoModel({
    required this.page,
    required this.perPage,
    required this.totalResults,
    required this.url,
    required this.videos,
  });

  factory PexelsVideoModel.fromJson(Map<String, dynamic> json) =>
      _$PexelsVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PexelsVideoModelToJson(this);
}

@JsonSerializable()
class Video {
  final int id;
  final int width;
  final int height;
  final String url;
  final String image;
  final int duration;
  final VideoUser user;

  @JsonKey(name: 'video_files')
  final List<VideoFile> videoFiles;

  @JsonKey(name: 'video_pictures')
  final List<VideoPicture> videoPictures;

  Video({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.image,
    required this.duration,
    required this.user,
    required this.videoFiles,
    required this.videoPictures,
  });

  factory Video.fromJson(Map<String, dynamic> json) =>
      _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable()
class VideoUser {
  final int id;
  final String name;
  final String url;

  VideoUser({
    required this.id,
    required this.name,
    required this.url,
  });

  factory VideoUser.fromJson(Map<String, dynamic> json) =>
      _$VideoUserFromJson(json);

  Map<String, dynamic> toJson() => _$VideoUserToJson(this);
}

@JsonSerializable()
class VideoFile {
  final int id;
  final String quality;

  @JsonKey(name: 'file_type')
  final String fileType;

  final int? width;
  final int? height;
  final String link;

  VideoFile({
    required this.id,
    required this.quality,
    required this.fileType,
    this.width,
    this.height,
    required this.link,
  });

  factory VideoFile.fromJson(Map<String, dynamic> json) =>
      _$VideoFileFromJson(json);

  Map<String, dynamic> toJson() => _$VideoFileToJson(this);
}

@JsonSerializable()
class VideoPicture {
  final int id;
  final String picture;
  final int nr;

  VideoPicture({
    required this.id,
    required this.picture,
    required this.nr,
  });

  factory VideoPicture.fromJson(Map<String, dynamic> json) =>
      _$VideoPictureFromJson(json);

  Map<String, dynamic> toJson() => _$VideoPictureToJson(this);
}
