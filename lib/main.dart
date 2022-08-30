import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kibanda_kb/app/app.dart';
import 'package:kibanda_kb/utilities/rest_client/rest_client.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  ///Allow getit reassignments for smoother debuging
  GetIt.I.allowReassignment = true;

  ///Register the rest client to be accessible throughout the app {DI}
  GetIt.I.registerSingleton<RestClient>(RestClient());

  ///Get directory to store all state persists (Securely 😊😊)
  Directory storageDirectory = await getApplicationDocumentsDirectory();

  /// Initialize hydrated storage for all state persists storage
  final storage =
      await HydratedStorage.build(storageDirectory: storageDirectory);
  HydratedBlocOverrides.runZoned(
    () => runApp(KwikBasketKibandaApp()),
    createStorage: () async {
      return HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getTemporaryDirectory(),
      );
    },
  );
}
