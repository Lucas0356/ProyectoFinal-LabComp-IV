import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:animate_do/animate_do.dart';

import '../../domain/domain.dart';
import '../../config/config.dart';
import '../presentation.dart';

class DetallesPaisScreen extends ConsumerStatefulWidget {
  static const name = 'detalles-screen';

  final String paisID;

  const DetallesPaisScreen({super.key, required this.paisID});

  @override
  DetallesPaisScreenState createState() => DetallesPaisScreenState();
}

class DetallesPaisScreenState extends ConsumerState<DetallesPaisScreen> {
  bool selected = false;

  @override
  void initState() {
    final query = ref.read(nameSelectedProvider.notifier).state;
    final continent = ref.read(continentSelectedProvider.notifier).state;
    ref.read(getPaisByIDProvider.notifier).loadPais(widget.paisID, continent);
    ref.read(getPhotosProvider.notifier).loadImages(query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Pais? pais = ref.watch(getPaisByIDProvider)[widget.paisID];
    final photos = ref.watch(getPhotosProvider);
    final colors = Theme.of(context).colorScheme;

    if (pais == null || photos.isEmpty) {
      return Scaffold(
        body: FullScreenLoader(),
        backgroundColor: colors.primary,
      );
    }

    return Scaffold(
      backgroundColor: colors.secondary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.black38,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Swiper(
                itemCount: photos.length,
                scale: 1.0,
                autoplay: photos.length > 1,
                itemBuilder: (context, index) {
                  return _SlidePhotos(
                    url: photos[index],
                  );
                },
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    icon: Icon(Icons.favorite,
                        color: selected ? colors.primary : Colors.white),
                    onPressed: () {
                      setState(() {
                        selected = !selected; // Actualiza el estado
                      });
                    },
                  ))
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                _InfoPais(item: pais),
                const SizedBox(height: 30),
              ],
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _SlidePhotos extends StatelessWidget {
  final String url;

  const _SlidePhotos({required this.url});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45, blurRadius: 10, offset: Offset(0, 10)),
          ]),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _InfoPais extends StatelessWidget {
  final Pais item;

  const _InfoPais({required this.item});

  Widget separadorVertical(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.black26,
      margin: const EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        const SizedBox(height: 10),
        FadeInLeft(
          duration: const Duration(seconds: 1),
          child: ListTile(
            title: Text(item.name,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: colors.onPrimary)),
            subtitle: Text('Country of ${item.subregion}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
            trailing: Text(item.flag, style: const TextStyle(fontSize: 30)),
          ),
        ),
        separadorVertical(context),
        _RowInfo(
            title1: 'POPULATION',
            dato1: item.population,
            icon1: Icons.people,
            title2: 'CAPITAL',
            dato2: item.capital[0],
            icon2: Icons.location_city),
        _RowInfo(
          title1: 'CURRENCIES',
          dato1: item.currencies,
          icon1: Icons.monetization_on_rounded,
          title2: 'LANGUAGES',
          dato2: item.languages,
          icon2: Icons.language,
          delay: 500,
        ),
        _Rectangle(titulo: 'BORDERS', dato: item.borders, icon: Icons.flag)
      ],
    );
  }
}

class _RowInfo extends StatelessWidget {
  const _RowInfo(
      {required this.title1,
      required this.dato1,
      required this.icon1,
      required this.title2,
      required this.dato2,
      required this.icon2,
      this.delay = 250});

  final String title1;
  final dynamic dato1;
  final IconData icon1;
  final String title2;
  final dynamic dato2;
  final IconData icon2;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MidRectangle(
            titulo: title1,
            dato: dato1 is List ? HumanFormats.listToString(dato1) : dato1,
            icon: icon1,
            delay: delay,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 1,
            height: 35,
            color: Colors.black26,
          ),
          _MidRectangle(
            titulo: title2,
            dato: dato2 is List ? HumanFormats.listToString(dato2) : dato2,
            icon: icon2,
            delay: delay * 2,
          ),
        ],
      ),
    );
  }
}

class _MidRectangle extends StatelessWidget {
  const _MidRectangle(
      {required this.titulo,
      required this.dato,
      required this.icon,
      required this.delay});

  final String titulo;
  final dynamic dato;
  final IconData icon;
  final int delay;

  @override
  Widget build(BuildContext context) {
    String datoFormateado =
        dato is int ? HumanFormats.convertNumber(dato) : '$dato';
    final size = MediaQuery.of(context).size;

    return _DataMidRectangle(
        delay: delay,
        size: size,
        titulo: titulo,
        icon: icon,
        datoFormateado: datoFormateado);
  }
}

class _DataMidRectangle extends StatelessWidget {
  const _DataMidRectangle({
    required this.delay,
    required this.size,
    required this.titulo,
    required this.icon,
    required this.datoFormateado,
  });

  final int delay;
  final Size size;
  final String titulo;
  final IconData icon;
  final String datoFormateado;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FadeIn(
      delay: Duration(milliseconds: delay),
      duration: const Duration(seconds: 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width * 0.44,
          height: 100,
          color: colors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        datoFormateado,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle({
    required this.titulo,
    required this.dato,
    required this.icon,
  });

  final String titulo;
  final dynamic dato;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _DataRectangle(
              titulo: titulo,
              dato: (dato is List) ? HumanFormats.listToString(dato) : dato,
              icon: icon,
            )
          ],
        ));
  }
}

class _DataRectangle extends StatelessWidget {
  const _DataRectangle({
    required this.titulo,
    required this.icon,
    required this.dato,
  });

  final String titulo;
  final IconData icon;
  final String dato;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return FadeIn(
        delay: const Duration(milliseconds: 1250),
        duration: const Duration(seconds: 1),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: size.width * 0.94,
                height: 115,
                color: colors.primary,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        titulo,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                          ),
                          SizedBox(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  dato,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                        ],
                      )
                    ]))));
  }
}
