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
