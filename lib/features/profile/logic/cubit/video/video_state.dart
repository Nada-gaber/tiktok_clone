import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/video_model.dart';
part 'video_state.freezed.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState.initial() = _Initial;
  const factory VideoState.loading() = _Loading;
  const factory VideoState.loaded(PexelsVideoModel videoModel) = _Loaded;
  const factory VideoState.error(String message) = _Error;
}
