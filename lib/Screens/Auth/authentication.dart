import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../models/chat-user.dart';
import '../../models/message.dart';
import 'dart:io';


class Auth {
  static FirebaseAuth authInstance = FirebaseAuth.instance;

  static FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  static FirebaseStorage storageInstance = FirebaseStorage.instance;

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCred;
  }

  static Future<void> signOutFromGoogle() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  static User get userInstance => authInstance.currentUser!;

  static Future<bool> userExists() async {
    return (await firestoreInstance
            .collection('users')
            .doc(authInstance.currentUser!.uid)
            .get())
        .exists;
  }

  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final user = ChatUser(
      id: userInstance.uid,
      name: userInstance.displayName.toString(),
      email: userInstance.email.toString(),
      about: "Hey! Let's Chat!",
      image: userInstance.photoURL.toString(),
      createdAt: time,
      lastActive: time,
      isOnline: false,
      pushToken: '',
    );

    return (await firestoreInstance
        .collection('users')
        .doc(userInstance.uid)
        .set(user.toJson()));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return Auth.firestoreInstance
        .collection('users')
        .where('id', isNotEqualTo: userInstance.uid)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsersImage() {
    return Auth.firestoreInstance
        .collection('users')
        .snapshots();
  }

  static late ChatUser me;

  static Future<void> getSelfInfo() async {
    await firestoreInstance
        .collection('users')
        .doc(userInstance.uid)
        .get()
        .then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }
  static Future<void> checkPatient() async {
    await firestoreInstance
        .collection('users')
        .doc(userInstance.uid)
        .get()
        .then((user) async {
        if(user.data()?['email']=='shubhharde158@gmail.com'){
          print('true');
        }else{print('false');}
    });
  }

  static String getConversationID(String id) =>
      userInstance.uid.hashCode <= id.hashCode
          ? '${userInstance.uid}_$id'
          : '${id}_${userInstance.uid}';

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      ChatUser user) {
    return Auth.firestoreInstance
        .collection('chats/${getConversationID(user.id)}/messages/')
        .snapshots();
  }



  static Future<void> sendMessage(ChatUser user, String msg) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final Message message = Message(
        toId: user.id,
        msg: msg,
        read: '',
        type: Type.text,
        fromId: userInstance.uid,
        sent: time);
    final ref = firestoreInstance
        .collection('chats/${getConversationID(user.id)}/messages/');
    await ref.doc(time).set(message.toJson());
  }

  static Future<void> updateMessageReadStatus(Message message) async {
    final ref = firestoreInstance
        .collection('chats/${getConversationID(message.fromId)}/messages/')
        .doc(message.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }


  static Future<void> updateActiveStatus(bool isOnline) async {
    firestoreInstance.collection('users').doc(userInstance.uid).update({
      'push_token': me.pushToken,
    });
  }

  static Future<void> uploadToStorage(pickedFile) async{
    final file = File(pickedFile!.path!);
    final path = '${userInstance.email.toString()}/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }



}
