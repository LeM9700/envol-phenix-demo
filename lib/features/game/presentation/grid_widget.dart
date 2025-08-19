import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_assets.dart';
import '../../game/data/models/position.dart';

/// Widget personnalisé pour afficher la grille de jeu avec image d'arrière-plan
/// 
/// Ce widget combine plusieurs éléments visuels :
/// - Une image d'arrière-plan (fonctionne hors ligne)
/// - Une grille 3×3 dessinée avec CustomPainter
/// - Un pion positionnable sur la grille
/// - Le texte "départ" sur la case (0,0)
/// 
/// Utilise AspectRatio pour maintenir un carré parfait sur tous les appareils.
class GridWidget extends StatelessWidget {
  const GridWidget({super.key, required this.size, required this.pawn});

  /// Taille de la grille (ex: 3 pour une grille 3×3)
  final int size;
  
  /// Position actuelle du pion sur la grille
  final Position pawn;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Maintient un ratio carré (1:1)
      child: Stack(
        children: [
          // Couche 1 : Image d'arrière-plan intégrée (offline)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Coins arrondis
              child: Image.asset(
                AppAssets.bg,
                fit: BoxFit.cover, // Remplit tout l'espace disponible
                filterQuality: FilterQuality.none, // Pixel art net, sans flou
                cacheWidth: 512, // Cache optimisé pour éviter surconsommation mémoire
              ),
            ),
          ),
          
          // Couche 2 : Grille, pion et texte par-dessus l'image
          CustomPaint(
            painter: _GridPainter(size: size, pawn: pawn),
            child: const SizedBox.expand(), // Occupe tout l'espace du parent
          ),
        ],
      ),
    );
  }
}

/// Painter personnalisé pour dessiner la grille, le pion et les textes
/// 
/// Cette classe étend CustomPainter pour un rendu haute performance
/// des éléments graphiques de la grille :
/// - Lignes de la grille (horizontales et verticales)
/// - Pion du joueur (cercle coloré)
/// - Texte "départ" sur la case (0,0)
/// 
/// CustomPainter est optimal pour ce type de rendu car :
/// - Performance élevée (pas de widgets lourds)
/// - Contrôle total sur le rendu
/// - Rebuild optimisé (seulement quand nécessaire)
class _GridPainter extends CustomPainter {
  _GridPainter({required this.size, required this.pawn});

  /// Taille de la grille (nombre de cases par côté)
  final int size;
  
  /// Position actuelle du pion à dessiner
  final Position pawn;

  @override
  void paint(Canvas canvas, Size sizePx) {
    // Configuration du pinceau pour les lignes de grille
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255) // Blanc pour contraste
      ..strokeWidth = 1.0;

    // Calcul de la taille des cellules
    final cellW = sizePx.width / size;  // Largeur d'une cellule
    final cellH = sizePx.height / size; // Hauteur d'une cellule

    // Dessin des lignes de la grille (horizontales et verticales)
    for (int i = 0; i <= size; i++) {
      final dy = i * cellH; // Position Y de la ligne horizontale
      final dx = i * cellW; // Position X de la ligne verticale
      
      // Ligne horizontale (de gauche à droite)
      canvas.drawLine(Offset(0, dy), Offset(sizePx.width, dy), paint);
      
      // Ligne verticale (de haut en bas)
      canvas.drawLine(Offset(dx, 0), Offset(dx, sizePx.height), paint);
    }

    // Dessin du pion du joueur
    final pawnCenter = Offset(
      (pawn.col + 0.5) * cellW, // Centre horizontal de la cellule
      (pawn.row + 0.5) * cellH, // Centre vertical de la cellule
    );
    final pawnPaint = Paint()..color = AppColors.accent; // Couleur violette claire
    
    // Dessiner un cercle pour représenter le pion
    canvas.drawCircle(pawnCenter, (cellW + cellH) / 8, pawnPaint);

    // Dessin du texte "départ" sur la case de départ (0,0)
    final startCellCenter = Offset(
      (0 + 0.5) * cellW, // Centre de la première colonne (col 0)
      (0 + 0.5) * cellH, // Centre de la première ligne (row 0)
    );
    
    // Configuration du texte à afficher
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'départ',
        style: TextStyle(
          color: Colors.grey,      // Couleur discrète mais lisible
          fontSize: 10,           // Petite taille pour ne pas encombrer
          fontWeight: FontWeight.bold, // Gras pour la lisibilité
        ),
      ),
      textDirection: TextDirection.ltr, // Direction de lecture (gauche à droite)
    );
    textPainter.layout(); // Calcule les dimensions du texte
    
    // Calcul de la position pour centrer le texte dans la case (0,0)
    final textOffset = Offset(
      startCellCenter.dx - textPainter.width / 2,  // Centrage horizontal
      startCellCenter.dy - textPainter.height / 2, // Centrage vertical
    );
    
    // Dessin effectif du texte sur le canvas
    textPainter.paint(canvas, textOffset);
  }

  /// Détermine si le painter doit être redessiné
  /// 
  /// Return true si la position du pion ou la taille de grille a changé,
  /// ce qui optimise les performances en évitant les redraws inutiles.
  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.pawn != pawn || oldDelegate.size != size;
  }
}
