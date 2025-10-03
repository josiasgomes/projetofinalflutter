import 'package:myapp/src/model/cliente.dart';
import 'package:myapp/src/core/database/firestore.dart';

class ClientesRepository {
  Future<void> addCliente(Map clienteMap) async {
    await DataBase.clientesCollection.add(clienteMap);
  }

  Stream<List<Cliente>> getClienteCollection() {
    return DataBase.clientesCollection
        .orderBy("data", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Cliente.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
