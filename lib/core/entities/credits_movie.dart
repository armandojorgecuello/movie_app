import 'package:equatable/equatable.dart';
import 'package:movies_app/core/entities/cast.dart';

class CreditsMovie extends Equatable {
    CreditsMovie({
        this.id,
        this.cast,
        this.crew,
    });

    int? id;
    List<Cast>? cast;
    List<Cast>? crew;

    @override
    List<Object?> get props => [
      id,
      cast,
      crew,
    ];
}


