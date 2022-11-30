import 'package:equatable/equatable.dart';

class Cast extends Equatable{
    Cast({
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
