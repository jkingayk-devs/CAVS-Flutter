import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Product>> streamProducts() {
    return _db.collection('products').snapshots().map((snap) =>
      snap.docs.map((d) => Product.fromMap(d.data(), d.id)).toList());
  }

  Future<void> addProduct(Product p) async {
    await _db.collection('products').add(p.toMap());
  }

  Future<void> updateProduct(Product p) async {
    await _db.collection('products').doc(p.id).update(p.toMap());
  }

  Future<void> deleteProduct(String id) async {
    await _db.collection('products').doc(id).delete();
  }

  Future<void> createOrder(Map<String, dynamic> orderData) async {
    await _db.collection('orders').add(orderData);
  }

  Stream<QuerySnapshot> streamOrders() {
    return _db.collection('orders').orderBy('created_at', descending: true).snapshots();
  }

  Future<void> updateOrderStatus(String id, String status) async {
    await _db.collection('orders').doc(id).update({'status': status});
  }
}
