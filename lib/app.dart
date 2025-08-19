import 'package:flutter/material.dart';
import 'core/router.dart';
import 'core/theme.dart';

/// Widget principal de l'application "L'Envol du Phénix"
/// 
/// Configure l'application Flutter avec :
/// - Navigation via GoRouter
/// - Thème personnalisé
/// - Titre de l'application
class PhenixApp extends StatelessWidget {
  const PhenixApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuration du routeur pour la navigation entre écrans
    final router = buildRouter();
    
    return MaterialApp.router(
      title: 'L\'Envol du Phénix – Démo',
      theme: buildTheme(), // Thème personnalisé de l'application
      routerConfig: router, // Configuration des routes
      debugShowCheckedModeBanner: false, // Masque le banner debug en mode développement
    );
  }
}
