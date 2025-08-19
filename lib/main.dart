import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

/// Point d'entrée principal de l'application "L'Envol du Phénix"
/// 
/// Initialise Flutter et lance l'application dans un ProviderScope
/// pour activer la gestion d'état Riverpod dans toute l'application.
void main() {
  // S'assure que les bindings Flutter sont initialisés avant le lancement
  WidgetsFlutterBinding.ensureInitialized();
  
  // Lance l'application avec Riverpod pour la gestion d'état globale
  runApp(const ProviderScope(child: PhenixApp()));
}
