import 'dart:io';

import 'package:base_de_projet/presentation/account/modify_account/modify_account_page.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoProfile {
  static Future showChoiceDialog(BuildContext context) {
    return showDialog(
        context: scaffoldKeyModifyAccount.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(height: 1, color: Colors.blue),
                  ListTile(
                    onTap: () async {
                      final xfile = await _openGallery(
                          scaffoldKeyModifyAccount.currentContext!);
                      Navigator.pop(scaffoldKeyModifyAccount.currentContext!);
                      if (xfile != null) {
                        await context
                            .read(authRepositoryProvider)
                            .uploadPhotoProfile(File(xfile.path));
                        scaffoldKeyModifyAccount.currentContext!
                            .refresh(currentPhotoProfile);
                      }
                    },
                    title: Text("Gallery"),
                    leading: Icon(Icons.account_box, color: Colors.blue),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () async {
                      final xfile = await _openCamera(
                          scaffoldKeyModifyAccount.currentContext!);
                      Navigator.pop(scaffoldKeyModifyAccount.currentContext!);
                      if (xfile != null) {
                        await context
                            .read(authRepositoryProvider)
                            .uploadPhotoProfile(File(xfile.path));
                        scaffoldKeyModifyAccount.currentContext!
                            .refresh(currentPhotoProfile);
                      }
                    },
                    title: Text("Camera"),
                    leading: Icon(Icons.camera, color: Colors.blue),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Future<XFile?> _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  static Future<XFile?> _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    return await _picker.pickImage(source: ImageSource.camera);
  }
}
