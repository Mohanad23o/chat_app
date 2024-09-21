import 'package:chat_app_c11/features/register/data/models/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseUtils {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
            fromFirestore: (snapshot, options) =>
                MyUser.fromJson(snapshot.data()!),
            toFirestore: (user, options) => user.toJson());
  }

  static Future<void> registerUser(MyUser user) async {
    return getUserCollection().doc(user.uId).set(user);
  }

  static Future<MyUser?> getUser(String uId) async {
    var documentSnapShot = await getUserCollection().doc(uId).get();
    return documentSnapShot.data();
  }
}
