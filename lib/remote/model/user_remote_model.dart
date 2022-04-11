import 'package:equatable/equatable.dart';

class UserRemoteModel extends Equatable {
  final String email;
  final String id;
  final String name;
  final String profilImage;

  const UserRemoteModel({
    required this.email,
    required this.id,
    required this.name,
    required this.profilImage,
  });

  @override
  List<Object> get props => [email, id, name, profilImage];

  @override
  String toString() {
    return 'UserRemoteModel(email: $email, id: $id, name: $name, profilImage: $profilImage)';
  }
}
