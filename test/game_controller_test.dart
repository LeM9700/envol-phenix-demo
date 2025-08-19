/// Tests unitaires pour le GameController
/// 
/// Ces tests vérifient la logique métier du jeu :
/// - Incrémentation du score lors des déplacements
/// - Respect des limites de la grille
/// - Fonctionnement du reset
/// - Validation des positions du pion
///
/// Utilise ProviderContainer pour tester les contrôleurs Riverpod
/// de manière isolée sans interface utilisateur.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:phenix_demo/features/game/logic/game_controller.dart';
import 'package:phenix_demo/features/game/data/models/position.dart';

void main() {
  group('GameController Tests', () {
    /// Test : vérification de l'incrémentation du score lors des déplacements
    /// 
    /// Valide que chaque déplacement valide :
    /// - Incrémente le score de +1
    /// - Déplace correctement le pion
    /// - Permet le reset à l'état initial
    testWidgets('Score increments on directional moves', (WidgetTester tester) async {
      // Création d'un container Riverpod isolé pour les tests
      final container = ProviderContainer();
      addTearDown(container.dispose); // Nettoyage après le test

      // Récupération du contrôleur et de l'état initial
      final controller = container.read(gameControllerProvider.notifier);
      final initialState = container.read(gameControllerProvider);

      // Vérification de l'état initial (score 0, pion en (0,0))
      expect(initialState.score, 0);
      expect(initialState.pawn, const Position(row: 0, col: 0));

      // Test déplacement vers la droite
      controller.moveRight();
      final stateAfterRight = container.read(gameControllerProvider);
      expect(stateAfterRight.score, 1); // Score incrémenté
      expect(stateAfterRight.pawn, const Position(row: 0, col: 1)); // Nouvelle position

      // Test déplacement vers le bas
      controller.moveDown();
      final stateAfterDown = container.read(gameControllerProvider);
      expect(stateAfterDown.score, 2); // Score à 2 après 2 déplacements
      expect(stateAfterDown.pawn, const Position(row: 1, col: 1)); // Position (1,1)

      // Test de la fonction reset
      controller.reset();
      final stateAfterReset = container.read(gameControllerProvider);
      expect(stateAfterReset.score, 0); // Score remis à 0
      expect(stateAfterReset.pawn, const Position(row: 0, col: 0)); // Pion au départ
    });

    /// Test : vérification du respect des limites de la grille
    /// 
    /// Valide que les déplacements impossibles (hors limites) :
    /// - Ne modifient pas la position du pion
    /// - N'incrémentent pas le score
    /// - Respectent les bordures de la grille 3×3
    testWidgets('Movement boundaries are respected', (WidgetTester tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(gameControllerProvider.notifier);
      
      // Test limite gauche : tentative de déplacement impossible depuis (0,0)
      controller.moveLeft();
      final stateAfterLeft = container.read(gameControllerProvider);
      expect(stateAfterLeft.pawn, const Position(row: 0, col: 0)); // Position inchangée
      expect(stateAfterLeft.score, 0); // Score inchangé (pas de mouvement valide)

      // Test limite haute : tentative de déplacement impossible depuis (0,0)
      controller.moveUp();
      final stateAfterUp = container.read(gameControllerProvider);
      expect(stateAfterUp.pawn, const Position(row: 0, col: 0)); // Position inchangée
      expect(stateAfterUp.score, 0); // Score inchangé (pas de mouvement valide)
    });
  });
}
