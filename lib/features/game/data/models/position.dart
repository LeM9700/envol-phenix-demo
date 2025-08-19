/// Modèle de données représentant une position sur la grille de jeu
/// 
/// Cette classe immuable encapsule les coordonnées (ligne, colonne)
/// d'un élément sur la grille 3x3. Elle est utilisée pour :
/// - La position du pion du joueur
/// - Les positions des obstacles (futures fonctionnalités)
/// - Tout élément nécessitant un positionnement sur la grille
class Position {
  /// Numéro de ligne (0-indexé, 0 = première ligne)
  final int row;
  
  /// Numéro de colonne (0-indexé, 0 = première colonne)
  final int col;

  /// Constructeur pour créer une position avec des coordonnées spécifiques
  const Position({required this.row, required this.col});

  /// Crée une nouvelle position en modifiant seulement les propriétés spécifiées
  /// 
  /// Utile pour les déplacements : on peut créer une nouvelle position
  /// en changeant seulement la ligne ou la colonne.
  Position copyWith({int? row, int? col}) =>
      Position(row: row ?? this.row, col: col ?? this.col);

  /// Comparaison d'égalité entre deux positions
  /// Deux positions sont égales si elles ont les mêmes coordonnées
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Position && other.row == row && other.col == col;

  /// Génère un code de hachage basé sur les coordonnées
  /// Nécessaire pour utiliser Position comme clé dans des Map ou Set
  @override
  int get hashCode => Object.hash(row, col);
}
