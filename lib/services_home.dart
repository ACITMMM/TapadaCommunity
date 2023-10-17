import 'package:flutter/material.dart';
import 'settings.dart';
import 'saude.dart';
import 'seguranca_social.dart';
import 'nacionalidade.dart';
import 'iniciativa.dart';
import 'habitacao.dart';
import 'financas.dart';
import 'info.dart';
import 'formacoes.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    // Add functionality for the more button
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Image.asset('assets/avatar.jpeg', height: 80, width: 80), // Adjust height and width as needed
          Text('Name', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),                    
          Row(
                children: [
                    Expanded(
                    child: Column(
                        children: [
                        Container(
                            height: 160, // Adjust as needed
                            width: 160, // Adjust as needed
                            padding: EdgeInsets.all(8.0), // Add padding
                            child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SaudePage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                            child: Text(
                                'Saúde',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ),
                        ),
                        Container(
                            height: 160, // Adjust as needed
                            width: 160, // Adjust as needed
                            padding: EdgeInsets.all(8.0), // Add padding
                            child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SegurancaSocialPage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                            child: Text(
                                'Segurança Social',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ),
                        ),
                        Container(
                            height: 160, // Adjust as needed
                            width: 160, // Adjust as needed
                            padding: EdgeInsets.all(8.0), // Add padding
                            child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NacionalidadePage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                            child: Text(
                                'Nacionalidade',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ),
                        ),
                        Container(
                            height: 160, // Adjust as needed
                            width: 160, // Adjust as needed
                            padding: EdgeInsets.all(8.0), // Add padding
                            child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => IniciativaPage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                            child: Text(
                                'Iniciativas',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ),
                        ),
                        ],
                    ),
                    ),
                    Expanded(
                    child: Column(
                        children: [
                        Container(
                            height: 160, // Adjust as needed
                            width: 160, // Adjust as needed
                            padding: EdgeInsets.all(8.0), // Add padding
                            child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HabitacaoPage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                            child: Text(
                                'Habitação',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ),
                        ),
                        Container(
                            height: 160, // Adjust as needed
                            width: 160, // Adjust as needed
                            padding: EdgeInsets.all(8.0), // Add padding
                            child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FinancasPage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                            child: Text(
                                'Finanças',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ),
                        ),
                        Container(
                            height: 160, // Adjust as needed
                            width: 160, // Adjust as needed
                            padding: EdgeInsets.all(8.0), // Add padding
                            child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => InfoPage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                            child: Text(
                                '+INFO',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ),
                        ),
                        Container(
                            height: 160, // Adjust as needed
                            width: 160, // Adjust as needed
                            padding: EdgeInsets.all(8.0), // Add padding
                            child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FormacoesPage()),
                                );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                ),
                            ),
                            child: Text(
                                'Formaçoes',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ),
                        ),
                        ],
                    ),
                    ),
                ],
            )
        ],
      ),
    );
  }
}
