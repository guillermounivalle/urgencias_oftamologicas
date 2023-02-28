import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:urgencias_oftamologicas/src/blocs/infrastructure/database/persistent.entity.dart';

typedef S ItemCreator<S>(Map<String, dynamic> json);

class DBRepository<T extends PersistentEntity> {
  static final _databaseProvider = FirebaseFirestore.instance;
  String tableName;
  final ItemCreator<T> creator;

  DBRepository(this.tableName, this.creator);

  Future<T> save(T entity) async {
    final db = await _databaseProvider.collection( this.tableName );
    await db.doc(entity.getId()).set( entity.toJson() );
    return Future.value( entity );
  }

  Future<List<T>> findAll() async {
    final db = await _databaseProvider.collection( this.tableName );
    final all = await db.get();
    return Future.value( all.docs.map((e) => this.creator(e.data()) ).toList() );
  }
}