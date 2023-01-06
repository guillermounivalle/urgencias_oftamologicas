import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urgencias_oftamologicas/infrastructure/auth/authentication.model.dart';

class AuthorizationService {
  static final _databaseProvider = FirebaseFirestore.instance;

  Future<StaffAuthorization> authorizationFor(String uuid) async {
    final db = await _databaseProvider.collection( 'medicalstaff' );
    final result = await db.doc( uuid ).get();
    return Future.value( StaffAuthorization.fromJson( result.data()! ) );
  }
}