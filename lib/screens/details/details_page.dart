import 'package:app_ong/api/web_client.dart';
import 'package:app_ong/models/animal.dart';
import 'package:app_ong/widgets/ong_app_theme.dart';
import 'package:app_ong/widgets/botao_adotar.dart';
import 'package:app_ong/screens/details/details_controller.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
  final Animal animal;
  final String pet;
  const DetailsPage({Key? key,required this.animal, required this.pet}): super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsController detailsController = DetailsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  OngAppTheme.modelAppBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
                    widget.animal.image!.url!,
                    height: 250,
                    width: double.maxFinite,
                  ),
            Padding(
              padding:const EdgeInsets.fromLTRB(8, 24, 8, 8),
              child: Text(
                widget.animal.name!,
                style: TextStyle(fontSize: 24, fontFamily: OngAppTheme.mainFont),
              ),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                widget.animal.description ?? 'Descrição não informada pelo dono',
                style: TextStyle(fontSize: 16, fontFamily: OngAppTheme.mainFont),
              ),
            ),
            const BotaoAdotar()
          ],
        ),
      ),
    );
  }
}
