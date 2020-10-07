class CieloHabitacion {
  CieloHabitacion({
    this.tipoHabitacion,
    this.capacidad,
    this.images,
    this.precio,
    this.color
    });
  final String tipoHabitacion;
  final double precio;
  final double capacidad;
  final List<String> images;
  final int color;
}

final habitacion = <CieloHabitacion>[
  CieloHabitacion(
    tipoHabitacion: 'Individual',
    capacidad: 1,
    images: [
      'assets/UNE.png',
      'images/mm.jpg',
      'images/promo.jpg'
    ],
    precio: 400,
    color: 0xFFF6F6F6,
  ),

  CieloHabitacion(
    tipoHabitacion: 'Matrimonial',
    capacidad: 2,
    images: [
      'assets/UNE.png',
      'images/mm.jpg',
      'images/promo.jpg'
    ],
    precio: 600,
    color: 0xFFFCF5EB
  ),

  CieloHabitacion(
    tipoHabitacion: 'Comun',
    capacidad: 6,
    images: [
      'assets/UNE.png',
      'images/mm.jpg',
      'images/promo.jpg'
    ],
    precio: 100,
    color: 0xFFFEF7ED
  ),
];