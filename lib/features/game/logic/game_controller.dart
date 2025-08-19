import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/app_constants.dart';
import '../data/models/position.dart';

/// État immutable du jeu contenant toutes les données de la partie en cours
/// 
/// Cette classe représente l'état complet du jeu à un instant donné :
/// - La taille de la grille (3x3 par défaut)
/// - La position actuelle du pion du joueur
/// - Le score accumulé par le joueur
/// 
/// Étant immutable, chaque modification crée un nouvel état.
class GameState {
  /// Taille de la grille (3 = grille 3x3)
  final int gridSize;
  
  /// Position actuelle du pion sur la grille
  final Position pawn;
  
  /// Score actuel du joueur (incrémenté à chaque déplacement)
  final int score;

  /// Constructeur pour créer un état de jeu avec des valeurs spécifiques
  const GameState({required this.gridSize, required this.pawn, required this.score});

  /// Crée un nouvel état en modifiant seulement les propriétés spécifiées
  /// 
  /// Cette méthode suit le pattern de l'immutabilité : au lieu de modifier
  /// l'état existant, elle crée un nouvel état avec les nouvelles valeurs.
  GameState copyWith({int? gridSize, Position? pawn, int? score}) => GameState(
        gridSize: gridSize ?? this.gridSize,
        pawn: pawn ?? this.pawn,
        score: score ?? this.score,
      );

  /// Factory constructor pour créer l'état initial du jeu
  /// 
  /// Initialise une nouvelle partie avec :
  /// - Grille 3x3 (taille par défaut)
  /// - Pion en position (0,0) - case de départ
  /// - Score à 0
  factory GameState.initial() {
    return GameState(
      gridSize: AppConstants.defaultGridSize,
      pawn: const Position(row: 0, col: 0), // Position de départ
      score: 0, // Score initial
    );
  }
}

/// Provider Riverpod pour le contrôleur de jeu
/// 
/// Ce provider permet d'accéder au GameController depuis n'importe où
/// dans l'arbre de widgets. Il gère automatiquement :
/// - La création et destruction du contrôleur
/// - La notification des widgets lors des changements d'état
/// - L'optimisation des rebuilds (seuls les widgets nécessaires sont reconstruits)
final gameControllerProvider =
    NotifierProvider<GameController, GameState>(GameController.new);

/// Contrôleur principal du jeu utilisant le pattern Notifier de Riverpod
/// 
/// Ce contrôleur gère toute la logique métier du jeu :
/// - Déplacements du pion (manuel et automatique)
/// - Gestion du score
/// - Validation des limites de la grille
/// - Réinitialisation de la partie
/// 
/// Il étend Notifier<GameState> pour une gestion d'état réactive
/// et performante avec Riverpod.
class GameController extends Notifier<GameState> {
  /// Initialise l'état du contrôleur avec les valeurs par défaut
  @override
  GameState build() => GameState.initial();

  /// Incrémente le score et déplace le pion d'une case (horizontale),
  /// en parcourant la grille de gauche à droite, puis ligne suivante.
  void addPointAndMove() {
    final size = state.gridSize;
    var r = state.pawn.row;
    var c = state.pawn.col;

    // Déplacement d'une case à droite si possible, sinon début de ligne suivante
    if (c < size - 1) {
      c += 1;
    } else {
      c = 0;
      if (r < size - 1) {
        r += 1;
      } else {
        // Option : revenir au départ quand on atteint la fin (boucle)
        r = 0;
      }
    }

    state = state.copyWith(
      score: state.score + 1,
      pawn: Position(row: r, col: c),
    );
  }

  void reset() {
    state = GameState.initial();
  }

  /// Déplace le pion vers le haut
  void moveUp() {
    if (state.pawn.row > 0) {
      state = state.copyWith(
        score: state.score + 1,
        pawn: Position(row: state.pawn.row - 1, col: state.pawn.col),
      );
    }
  }

  /// Déplace le pion vers le bas
  void moveDown() {
    if (state.pawn.row < state.gridSize - 1) {
      state = state.copyWith(
        score: state.score + 1,
        pawn: Position(row: state.pawn.row + 1, col: state.pawn.col),
      );
    }
  }

  /// Déplace le pion vers la gauche
  void moveLeft() {
    if (state.pawn.col > 0) {
      state = state.copyWith(
        score: state.score + 1,
        pawn: Position(row: state.pawn.row, col: state.pawn.col - 1),
      );
    }
  }

  /// Déplace le pion vers la droite
  void moveRight() {
    if (state.pawn.col < state.gridSize - 1) {
      state = state.copyWith(
        score: state.score + 1,
        pawn: Position(row: state.pawn.row, col: state.pawn.col + 1),
      );
    }
  }
}
