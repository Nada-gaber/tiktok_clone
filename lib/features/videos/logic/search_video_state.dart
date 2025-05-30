import '../../home/data/models/video_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_video_state.freezed.dart';

@freezed
class SearchVideoState with _$SearchVideoState {
  const factory SearchVideoState.initial() = _Initial;
  const factory SearchVideoState.loading() = _Loading;
  const factory SearchVideoState.loaded(List<Hit> videos) = _Loaded;
  const factory SearchVideoState.error(String message) = _Error;
}