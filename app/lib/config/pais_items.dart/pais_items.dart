class PaisItems {
  final String text;
  final String asset;

  PaisItems({required this.text, required this.asset});
}

// Si el día de mañana agregamos nuevos continentes, con solo
// agregarlos dentro de esta lista ya se mostrarían en el Home.
var paisItems = <PaisItems>[
  PaisItems(text: 'África', asset: 'assets/africa.png'),
  PaisItems(text: 'América', asset: 'assets/america.png'),
];
