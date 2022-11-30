import 'package:equatable/equatable.dart';
import 'package:movies_app/core/entities/credits_movie.dart';
import 'package:movies_app/core/models/cast_model.dart';

class CreditsMovieModel extends Equatable {
    CreditsMovieModel({
        this.id,
        this.cast,
        this.crew,
    });

    int? id;
    List<CastModel>? cast;
    List<CastModel>? crew;

    factory CreditsMovieModel.fromJson(Map<String, dynamic> json) => CreditsMovieModel(
        id: ((json["id"] ?? 0 ) as num).toInt(),
        cast: json["cast"] != null ? List<CastModel>.from(json["cast"].map((x) => CastModel.fromJson(x))) : [],
        crew: json["crew"] != null ? List<CastModel>.from(json["crew"].map((x) => CastModel.fromJson(x))) : [],
    );

    CreditsMovie toEntity()=> CreditsMovie(
      id: id,
      cast: cast?.map((e) => e.toEntity()).toList(),
      crew: crew?.map((e) => e.toEntity()).toList(),
    );
    
      @override
      List<Object?> get props => [
        id,
        cast,
        crew,
      ];
}


