import 'package:flutter/material.dart';
import 'package:tapadacommunity/models/detail_service_model.dart';

class DetailServicePage extends StatelessWidget {
  final bool isDarkGreen;
  final DetailServiceModel service;

  const DetailServicePage({
    Key? key,
    required this.service,
    this.isDarkGreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: isDarkGreen ? Colors.green[900] : Colors.green,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .35,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        service.title,
                        style: const TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        service.subtitle,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(service.desc),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Localizacoes',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Outras Entidades',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Contato',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
