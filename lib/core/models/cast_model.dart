import 'package:equatable/equatable.dart';
import 'package:movies_app/core/entities/cast.dart';
import 'package:movies_app/ui/utils/constants/general.dart';

class CastModel extends Equatable{
    CastModel({
        this.adult,
        this.gender,
        this.id,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
        this.job,
    });

    bool? adult;
    int? gender;
    int? id;
    String? name;
    String? originalName;
    double? popularity;
    String? profilePath;
    int? castId;
    String? character;
    String? creditId;
    int? order;
    String? job;

    factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        adult: json["adult"] ?? false,
        gender: ((json["gender"] ?? 0) as num).toInt(),
        id: ((json["id"] ?? 0)as num).toInt(),
        name: json["name"] ?? kEmptyString,
        originalName: json["original_name"] ?? kEmptyString,
        popularity: ((json["popularity"].toDouble() ?? 0) as num).toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"] ?? kEmptyString,
        order: json["order"] == null ? null : json["order"],
        job: json["job"] == null ? null : json["job"],
    );

    Cast toEntity() => Cast(
      adult : adult,
      gender : gender,
      id : id,
      name : name,
      originalName : originalName,
      popularity : popularity,
      profilePath : profilePath,
      castId : castId,
      character : character,
      creditId : creditId,
      order : order,
      job : job,
    );
    
      @override
      List<Object?> get props =>[
        adult,
        gender,
        id,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order,
        job,
      ];

}
