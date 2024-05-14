import 'package:cours_flutter_update_app/constants.dart';
import 'package:cours_flutter_update_app/service/param_service.dart';
import 'package:flutter/material.dart';
import 'package:updat/updat.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _updatWidget(),
      body: const Center(
        child: Text('Hello World! version ${Constants.appVersion}'),
      ),
    );
  }

  Widget _updatWidget() {
    return UpdatWidget(
      currentVersion: Constants.appVersion,
      // Fonction pour récupérer la dernière version de l'app
      getLatestVersion: () async {
        var appVersion = await ParamService().getAppVersion();
        return appVersion;
      },
      // Fonction qui renvoie l'url où télécharger la dernière version de l'app
      getBinaryUrl: (version) async {
        // Construit la clé du paramètre contenant l'identifiant de l'exécutable à télécharger
        String paramKey = "demo_binary_id_$version";
        // Récupère l'id de l'exécutable
        var binaryIdParam = await ParamService().fetchParam(paramKey);
        // Construit l'url où l'on peut récupérer notre exécutable
        String binaryAssetId = binaryIdParam!.value;
        return "${Constants.uriAssets}/$binaryAssetId";
      },
      appName: "Démo Update App",
      getChangelog: (_, __) async {
        return "Un message random avec les change logs";
      },
    );
  }
}
