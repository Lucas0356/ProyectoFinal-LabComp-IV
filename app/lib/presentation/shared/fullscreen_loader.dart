import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Preparando el mapa mundial',
      'Descubriendo tesoros geográficos',
      'Calculando la distancia hasta el próximo país',
      '¡Aventurándonos en el mundo de las banderas!',
      'Buscando países para explorar',
      'Construyendo puentes diplomáticos',
      'Midiendo la altitud de las montañas',
      '¡Haciendo girar el globo terráqueo!',
      'Contando estrellas en la bandera',
      'Explorando rutas comerciales',
      'Sumergiéndonos en la diversidad cultural',
      'Conquistando fronteras',
      'Analizando coordenadas geográficas',
      '¡Preparándonos para el despegue!',
      'Esto está tardando más de lo esperado :('
    ];

    return Stream.periodic(const Duration(milliseconds: 2000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Espere por favor',
          style: textStyle.titleMedium,
        ),
        const SizedBox(height: 30),
        const CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
        const SizedBox(height: 30),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text(
                'Cargando ...',
                style: textStyle.titleSmall,
              );
            }
            return Text(
              snapshot.data!,
              style: textStyle.titleSmall,
            );
          },
        )
      ],
    ));
  }
}
