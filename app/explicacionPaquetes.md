# Explicación de los paquetes adicionales utilizados.

Utilizamos 3 paquetes adicionales que no son nativos de Flutter. Estos son:

- Card Swiper: Crea un swiper/carrusel de imágenes. Para utilizarlo, funciona similar a un ListView.builder
donde tienes que pasarle la cantidad de imágenes a mostrar (itemCount) y luego un itemBuilder con lo que irás mostrando. Además,
utilizamos la propiedad 'scale' para indicar la escala de la imagen.
Link: https://pub.dev/packages/card_swiper

- Intl: Utilizamos este paquete para formatear los números. Tiene la función de convertir '450000' en '450.000' así como también abreviar de 45.000.000 a 45M.
Link: https://pub.dev/packages/intl

- Animate Do: Este paquete fue creado por Fernando Herrera, y se utiliza para animar la entrada o salida de los widgets. Se utiliza muy fácilmente, solo se tiene que envolver al widget que deseamos animar con la animación deseada y listo.
Link: https://pub.dev/packages/animate_do

- Dio: Este paquete reemplaza al HTPP, y lo usamos porque lo vimos más sencillo a la hora de realizar las peticiones, manejar los headers, parámetros y demás.
Link: https://pub.dev/packages/dio

- Flutter Riverpod: Este paquete es un tipo de provider que reemplaza al provider clásico. Para usarlo, en primer lugar se tiene que envolver al MainApp dentro de un ProviderScope(). Luego, se tiene que definir el provider que queremos y qué estado va a manejar. Lo más clasico sería un StateProvider (tal y como lo usamos con el nameSelectedProvider). Para poder acceder a dicho provider se debe convertir el StatelessWidget en un ConsumerWidget o el StateFullWidget en un ConsumerStateFullWidget. Al utilizar este tipo de widgets, obtenemos acceso al 'ref'. Con el ref podemos 'escuchar' al provider, acceder a su estado, y cambiar su valor.
Link: https://pub.dev/packages/flutter_riverpod


Por ejemplo:
- ref.read(nameSelectedProvider).state = 'Argentina'            --> Estamos cambiando el valor del provider.
- ref.read(nameSelectedProvider).update((state) => 'Argentina') --> Otra forma de cambiar el valor del provider.
- ref.read(nameSelectedProvider.notifier).state                 --> De esta forma logramos acceder al estado actual. El notifier podemos verlo como el 'gestor' del provider.

- Go Router: Este paquete es gestor de rutas para la navegación entre pantallas. Tiene una función similar al Navigator. Para utilizarlo, debemos definir el 'GoRouter' que manejará nuestra aplicación, junto con las rutas que queramos. Dentro del main, debemos de utilizar el MaterialApp.router y asignar en el routerConfig el GoRouter previamente establecido.
Link: https://pub.dev/packages/go_router

