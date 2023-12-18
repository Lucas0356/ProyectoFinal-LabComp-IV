import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:proyecto_final/models/pais.dart';

class PaisTile extends StatelessWidget {
  final PaisSimplify paisSimplify;
  final int delay;

  const PaisTile({Key? key, required this.paisSimplify, required this.delay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: delay),
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: const Color(0xFF2F9BFF),
            height: 90,
            width: 200,
            child: ListTile(
              title: Text(
                paisSimplify.oficialName, // Acceder a la propiedad correcta
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              subtitle: Text(paisSimplify.capital[0],
                  style: const TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54)),
              leading: Text(
                paisSimplify.flag,
                style: const TextStyle(fontSize: 35),
              ),
              minLeadingWidth: 40,
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   '/registro',
                //   arguments: paisSimplify,
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
