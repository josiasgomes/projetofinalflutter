import 'dart:async';
import 'package:myapp/src/core/database/firestore.dart';
import 'package:myapp/src/model/orcamento.dart';

class OrcamentoRepository {
  DataBase dataBase = DataBase();

  Future<void> addOrcamento(Map orcamentoMap) async {
    await DataBase.orcamentosCollection.add(orcamentoMap);
  }

  Stream<List<Orcamento>> getOrcamentoMap() {
    return DataBase.orcamentosCollection
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Orcamento.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
