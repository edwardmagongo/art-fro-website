import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future userCheckup(BuildContext context) async {
  UsersRecord? currentUser;
  CartRecord? cartCreatedForUser;
  WalletRecord? walletCreatedFirstTIme;

  currentUser = await UsersRecord.getDocumentOnce(currentUserReference!);
  if (currentUser!.onboardingFinished) {
    if (currentUserDocument?.cartRef == null) {
      var cartRecordReference = CartRecord.collection.doc();
      await cartRecordReference.set(createCartRecordData(
        userRef: currentUserReference,
      ));
      cartCreatedForUser = CartRecord.getDocumentFromData(
          createCartRecordData(
            userRef: currentUserReference,
          ),
          cartRecordReference);

      await currentUserReference!.update(createUsersRecordData(
        cartRef: cartCreatedForUser?.reference,
      ));
    }
  } else {
    context.goNamed('onBoard_Profile');

    return;
  }

  if (currentUser?.wallet == null) {
    var walletRecordReference = WalletRecord.collection.doc();
    await walletRecordReference.set(createWalletRecordData(
      userRef: currentUserReference,
      balance: 0.0,
    ));
    walletCreatedFirstTIme = WalletRecord.getDocumentFromData(
        createWalletRecordData(
          userRef: currentUserReference,
          balance: 0.0,
        ),
        walletRecordReference);

    await currentUserReference!.update(createUsersRecordData(
      wallet: walletCreatedFirstTIme?.reference,
    ));
  }
}
