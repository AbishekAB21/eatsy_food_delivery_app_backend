import 'package:equatable/equatable.dart';

class OpeningHours extends Equatable {
  final String id;
  final String day;
  final double openAt;
  final double closeAt;
  final bool isOpen;

  OpeningHours(
      {required this.id,
      required this.day,
      required this.openAt,
      required this.closeAt,
      required this.isOpen});

  OpeningHours copyWith({
    String? id,
    String? day,
    double? openAt,
    double? closeAt,
    bool? isOpen,
  }) {
    return OpeningHours(
        id: id ?? this.id,
        day: day ?? this.day,
        openAt: openAt ?? this.openAt,
        closeAt: closeAt ?? this.closeAt,
        isOpen: isOpen ?? this.isOpen);
  }

// Used to covert model into a map for Firebase
  Map<String, dynamic> toDocument(){

    return{
      'id' : id,
      'day' : day,
      'openAt' : openAt,
      'closeAtt' : closeAt,
      'isOpen' : isOpen,
    };
  }

  factory OpeningHours.fromSnapshot(Map<String, dynamic> snap) {
    return OpeningHours(
        id: snap['id'].toString(),
        day: snap['day'],
        openAt: snap['openAt'],
        closeAt: snap['closeAt'],
        isOpen: snap['isOpen']);
  }

  @override
  List<Object?> get props => [id, day, openAt, closeAt, isOpen];

  static List<OpeningHours> openingHoursList = [
    OpeningHours(id: '1', day: 'Monday', openAt: 0, closeAt: 24, isOpen: true),
    OpeningHours(id: '2', day: 'Tuesday', openAt: 0, closeAt: 24, isOpen: true),
    OpeningHours(
        id: '3', day: 'Wednesday', openAt: 0, closeAt: 24, isOpen: true),
    OpeningHours(
        id: '4', day: 'Thursday', openAt: 0, closeAt: 24, isOpen: true),
    OpeningHours(id: '5', day: 'Friday', openAt: 0, closeAt: 24, isOpen: true),
    OpeningHours(
        id: '6', day: 'Saturday', openAt: 0, closeAt: 12, isOpen: true),
    OpeningHours(id: '7', day: 'Sunday', openAt: 0, closeAt: 24, isOpen: false),
  ];
}
