import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilImage;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.profilImage,
  });

  factory User.initial() => const User(
        id: '',
        email: '',
        name: '',
        profilImage: '',
      );

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;
    return User(
      id: userDoc.id,
      email: userData!['email'],
      name: userData['name'],
      profilImage: userData['profilImage'],
    );
  }

  @override
  List<Object> get props => [id, email, name, profilImage];

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, profilImage: $profilImage)';
  }
}
