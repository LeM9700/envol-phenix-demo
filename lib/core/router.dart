import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/home_screen.dart';
import '../features/game/presentation/game_screen.dart';

/// Configuration du routeur GoRouter pour la navigation de l'application
/// 
/// Définit les routes disponibles :
/// - '/' : Écran d'accueil (HomeScreen)
/// - '/game' : Écran de jeu (GameScreen)
/// 
/// Utilise MaterialPage pour des transitions fluides entre les écrans.
GoRouter buildRouter() {
  return GoRouter(
    routes: [
      // Route de l'écran d'accueil (page principale)
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeScreen(),
        ),
      ),
      
      // Route de l'écran de jeu avec grille 3x3
      GoRoute(
        name: 'game',
        path: '/game',
        pageBuilder: (context, state) => const MaterialPage(
          child: GameScreen(),
        ),
      ),
    ],
  );
}
