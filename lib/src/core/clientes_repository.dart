import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/src/model/cliente.dart';

class ClientesRepository {
  final CollectionReference _clientesCollection = FirebaseFirestore.instance
      .collection('clientes');

  Future<void> addCliente(Map clienteMap) async {
    await _clientesCollection.add(clienteMap);
  }

  Stream<List<Cliente>> getClienteCollection() {
    return _clientesCollection
        .orderBy("data", descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return Cliente.fromMap(doc.data() as Map<String, dynamic>);
          }).toList();
        });
  }
}
