import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s2ee_new/backend%20architecture/models/Entreprise.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Data {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuth _auth = FirebaseAuth.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
//firebase storage operations
  Future downloadFile(String path) async {
    try {
      String downloadUrl = await firebase_storage.FirebaseStorage.instance
          .ref(path + '.png')
          .getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e.toString());
    }
  }

//Bloc operations

//Entreprise Operations
  Stream<QuerySnapshot> getEntreprise() {
    return _firestore.collection("Entreprises").snapshots();
  }

  Stream<QuerySnapshot> getOuvrier() {
    return _firestore
        .collection("Entreprises")
        .where("ouvrier", isGreaterThan: 0)
        .snapshots();
  }

  Stream<QuerySnapshot> getPratique() {
    return _firestore
        .collection("Entreprises")
        .where("pratique", isGreaterThan: 0)
        .snapshots();
  }

  Stream<QuerySnapshot> getPfe() {
    return _firestore
        .collection("Entreprises")
        .where("pfe", isGreaterThan: 0)
        .snapshots();
  }

  Stream<QuerySnapshot> getEmploi() {
    return _firestore
        .collection("Entreprises")
        .where("emploi", isGreaterThan: 0)
        .snapshots();
  }

  //OFFRE OPERATIONS

  Stream<QuerySnapshot> getOffres() {
    return _firestore.collection("Offres").snapshots();
  }

  Stream<QuerySnapshot> getOuvrierOffres() {
    return _firestore
        .collection("Offres")
        .where("poste", isEqualTo: "Stage ouvrier")
        .snapshots();
  }

  Stream<QuerySnapshot> getPratiqueOffres() {
    return _firestore
        .collection("Offres")
        .where("poste", isEqualTo: "Stage pratique")
        .snapshots();
  }

  Stream<QuerySnapshot> getPfeOffres() {
    return _firestore
        .collection("Offres")
        .where("poste", isEqualTo: "Stage PFE")
        .snapshots();
  }

  Stream<QuerySnapshot> getEmploiOffres() {
    return _firestore
        .collection("Offres")
        .where("poste", isEqualTo: "Offre Emploi")
        .snapshots();
  }

  StreamZip<QuerySnapshot> getDeveloppementOffres() {
    Stream<QuerySnapshot> stream1 = _firestore
        .collection("Offres")
        .where("profile", isEqualTo: "Développeur Web")
        .snapshots();
    Stream<QuerySnapshot> stream2 = _firestore
        .collection("Offres")
        .where("profile", isEqualTo: "Développeur Mobile")
        .snapshots();
    return StreamZip([stream1, stream2]);
  }

//Authentication operations
  signInwithEmail(String _email) async {
    try {
      dynamic result = await _auth.createUserWithEmailAndPassword(
          email: _email, password: "1234567");
      return result;
    } catch (e) {
      dynamic result = await _auth.signInWithEmailAndPassword(
          email: _email, password: "1234567");
      print(e.toString());
      return result;
    }
  }

  signOut() async {
    await _auth.signOut();
  }
//Favorites operations

  Future<void> addFavorite(Entreprise entreprise) async {
    final User user = _auth.currentUser!;
    entreprise.favorites!.add(user.uid);
    await _firestore
        .collection("Entreprises")
        .doc(entreprise.nom)
        .update({"favorites": entreprise.favorites});
  }

  deleteFavorite(Entreprise entreprise) async {
    final User user = _auth.currentUser!;
    entreprise.favorites!.remove(user.uid);

    await _firestore
        .collection("Entreprises")
        .doc(entreprise.nom)
        .update({"favorites": entreprise.favorites});
  }

  Stream<QuerySnapshot>? showFavorite() {
    final User? user = _auth.currentUser;
    if (user != null) {
      return _firestore
          .collection("Entreprises")
          .where("favorites", arrayContains: user.uid)
          .snapshots();
    } else {
      print("No user");
    }
  }
}
