import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/app_colors.dart';
import '../logic/game_controller.dart';
import 'grid_widget.dart';

/// Écran principal de jeu avec grille 3×3 et contrôles de déplacement
/// 
/// Cet écran implémente toutes les fonctionnalités demandées :
/// - Grille 3×3 avec image d'arrière-plan
/// - Pion déplaçable via boutons directionnels
/// - Système de score (+1 par déplacement)
/// - Bouton Reset pour recommencer
/// - Image offline intégrée
/// 
/// Utilise ConsumerWidget pour écouter les changements d'état du GameController
/// via Riverpod et rebuilder automatiquement l'interface quand nécessaire.
class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Écoute les changements d'état du jeu (position pion, score)
    final state = ref.watch(gameControllerProvider);
    // Accès au contrôleur pour déclencher les actions (déplacements, reset)
    final controller = ref.read(gameControllerProvider.notifier);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420), // Largeur max pour tablettes
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Grille 3×3', style: TextStyle(fontSize: 16)),
                      Chip(
                        label: Text('Score: ${state.score}'),
                        backgroundColor: AppColors.surface,
                      ),
                    ],
                  ),
                      const SizedBox(height: 16),
                      GridWidget(size: state.gridSize, pawn: state.pawn),
                      const SizedBox(height: 16),
                      
                      // Bouton "+1 point" principal (exigence test)
                      ElevatedButton(
                        onPressed: controller.addPointAndMove,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: const Text('+1 point'),
                      ),
                      
                      const SizedBox(height: 16),
                      const Text('Ou utilisez les flèches :', 
                                 style: TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(height: 8),
                      _buildControlButtons(controller),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: controller.reset,
                            child: const Text('Reset'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  /// Widget constructeur pour les boutons de contrôle directionnel du pion
  /// 
  /// Crée une interface en forme de croix avec 4 boutons :
  /// - Bouton ↑ (haut) : déplace le pion vers le haut si possible
  /// - Bouton ↓ (bas) : déplace le pion vers le bas si possible  
  /// - Bouton ← (gauche) : déplace le pion vers la gauche si possible
  /// - Bouton → (droite) : déplace le pion vers la droite si possible
  /// 
  /// Chaque déplacement valide incrémente automatiquement le score de +1.
  /// Les déplacements sont bloqués aux limites de la grille 3×3.
  Widget _buildControlButtons(GameController controller) {
    return Column(
      children: [
        // Bouton déplacement vers le haut
        IconButton(
          onPressed: controller.moveUp,
          icon: const Icon(Icons.keyboard_arrow_up, size: 32),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.surface,
            foregroundColor: AppColors.primary,
          ),
        ),
        
        // Ligne centrale avec boutons gauche et droite
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bouton déplacement vers la gauche
            IconButton(
              onPressed: controller.moveLeft,
              icon: const Icon(Icons.keyboard_arrow_left, size: 32),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.surface,
                foregroundColor: AppColors.primary,
              ),
            ),
            
            const SizedBox(width: 40), // Espace central pour l'esthétique
            
            // Bouton déplacement vers la droite
            IconButton(
              onPressed: controller.moveRight,
              icon: const Icon(Icons.keyboard_arrow_right, size: 32),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.surface,
                foregroundColor: AppColors.primary,
              ),
            ),
          ],
        ),
        
        // Bouton déplacement vers le bas
        IconButton(
          onPressed: controller.moveDown,
          icon: const Icon(Icons.keyboard_arrow_down, size: 32),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.surface,
            foregroundColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
