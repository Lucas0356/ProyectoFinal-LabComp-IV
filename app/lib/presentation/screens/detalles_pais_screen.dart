import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_final/config/helpers/human_formats.dart';
import 'package:proyecto_final/domain/entities/pais/pais.dart';
import 'package:proyecto_final/presentation/providers/providers.dart';
import 'package:proyecto_final/presentation/shared/shareds.dart';

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
    final color = Theme.of(context).primaryColor;
    final photos = ref.watch(getPhotosProvider);

    if (pais == null || photos.isEmpty) {
      return const Scaffold(body: FullScreenLoader());
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                  return _Slide(
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
                        color: selected ? color : Colors.white),
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
              children: [_Pais(item: pais), const SizedBox(height: 30)],
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _Slide extends StatelessWidget {
  final String url;

  const _Slide({required this.url});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10)),
        ]);

    return DecoratedBox(
      decoration: decoration,
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Pais extends StatelessWidget {
  final Pais item;

  const _Pais({required this.item});

  @override
  Widget build(BuildContext context) {
    String borders =
        '${item.borders.take(item.borders.length - 1).join(', ')}${item.borders.length > 1 ? ', ' : ''}${item.borders.last}.';
    String currencies =
        '${item.currencies.take(item.currencies.length - 1).join(', ')}${item.currencies.length > 1 ? ', ' : ''}${item.currencies.last}.';
    String languages =
        '${item.languages.take(item.languages.length - 1).join(', ')}${item.languages.length > 1 ? ', ' : ''}${item.languages.last}.';

    return Column(
      children: [
        const SizedBox(height: 10),
        FadeInLeft(
          duration: const Duration(seconds: 1),
          child: ListTile(
            title: Text(item.name,
                style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            subtitle: Text('Country of ${item.subregion}',
                style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 20,
                    fontWeight: FontWeight.w200)),
            trailing: Text(item.flag, style: const TextStyle(fontSize: 30)),
          ),
        ),
        // Separador horizontal
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.black26,
          margin: const EdgeInsets.all(10),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MidRectangle(
                titulo: 'POPULATION',
                dato: item.population,
                icon: Icons.people,
                delay: 250,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 1,
                height: 35,
                color: Colors.black26,
              ),
              _MidRectangle(
                titulo: 'CAPITAL',
                dato: item.capital[0],
                icon: Icons.location_city,
                delay: 500,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MidRectangle(
                titulo: 'CURRENCIES',
                dato: currencies,
                icon: Icons.monetization_on_rounded,
                delay: 750,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 1,
                height: 35,
                color: Colors.black26,
              ),
              _MidRectangle(
                titulo: 'LANGUAGES',
                dato: languages,
                icon: Icons.language,
                delay: 1000,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Rectangle(titulo: 'BORDERS', dato: borders, icon: Icons.flag)
            ],
          ),
        )
      ],
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
  final dato;
  final IconData icon;
  final int delay;

  @override
  Widget build(BuildContext context) {
    String datoFormateado =
        dato is int ? HumanFormats.convertNumber(dato) : '$dato';
    final size = MediaQuery.of(context).size;

    return FadeIn(
      delay: Duration(milliseconds: delay),
      duration: const Duration(seconds: 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width * 0.44,
          height: 100,
          color: Colors.blue[400],
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
                    fontFamily: 'Jost',
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
                        '$datoFormateado',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Jost'),
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
  final dato;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      delay: const Duration(milliseconds: 1250),
      duration: const Duration(seconds: 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width * 0.94,
          height: 115,
          color: Colors.blue[400],
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
                    fontFamily: 'Jost',
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
                          '$dato',
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Jost'),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
