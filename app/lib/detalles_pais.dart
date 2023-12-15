// ignore: file_names
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/human_formats.dart';
import 'package:proyecto_final/pais.dart';

class DetallesPaisScreen extends StatefulWidget {
  static const name = 'home-screen';

  final Pais pais;

  const DetallesPaisScreen({super.key, required this.pais});

  @override
  State<DetallesPaisScreen> createState() => _DetallesPaisScreenState();
}

class _DetallesPaisScreenState extends State<DetallesPaisScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.black38,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Swiper(
                itemCount: 5,
                viewportFraction: 1.0,
                scale: 1.0,
                autoplay: true,
                itemBuilder: (context, index) {
                  return _Slide(contador: index);
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
                        color: selected ? Colors.red : Colors.white),
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
                _Pais(item: widget.pais),
              ],
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _Slide extends StatelessWidget {
  final contador;

  const _Slide({required this.contador});

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
        "https://images.unsplash.com/photo-1575664274476-e02d99195164?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
    return Column(
      children: [
        const SizedBox(height: 10),
        ListTile(
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
          trailing: Text(item.flag, style: const TextStyle(fontSize: 50)),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.black26,
          margin: EdgeInsets.all(10),
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
                dato: item.currencies[0],
                icon: Icons.monetization_on_rounded,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 1,
                height: 35,
                color: Colors.black26,
              ),
              _MidRectangle(
                titulo: 'LANGUAGES',
                dato: item.languages[0],
                icon: Icons.language,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Rectangle(
                  titulo: 'BORDERS',
                  dato: item.borders.toString(),
                  icon: Icons.flag)
            ],
          ),
        )
      ],
    );
  }
}

class _MidRectangle extends StatelessWidget {
  const _MidRectangle({
    required this.titulo,
    required this.dato,
    required this.icon,
  });

  final String titulo;
  final dato;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    String datoFormateado =
        dato is int ? HumanFormats.convertNumber(dato) : '$dato';

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 170,
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
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '$datoFormateado',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontSize: 15,
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 340,
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
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        '$dato',
                        maxLines: 2,
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
    );
  }
}
