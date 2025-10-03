import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  static CollectionReference clientesCollection =
      FirebaseFirestore.instance.collection('clientes');

  static CollectionReference orcamentosCollection = FirebaseFirestore.instance.collection('orcamentos');
}
