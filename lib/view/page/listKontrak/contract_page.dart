import 'package:flutter/material.dart';
import 'package:mobile_sisola_dev/provider/service/service_kontrak.dart';
import 'package:mobile_sisola_dev/view/Widget/global_widget.dart';
import 'package:provider/provider.dart';

class ContractPage extends StatefulWidget {
  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<ServicesKontrak>(context, listen: false)
        .getAllContract("dummy@mail.com");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ServicesKontrak>(context, listen: false)
          .getAllContract("dummy@mail.com"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading;
        } else {
          return Consumer<ServicesKontrak>(
            builder: (context, data, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: data.kontrak.length,
                  itemBuilder: (context, i) =>
                      cardSingleLine(data.kontrak[i].cONTRACTNO, "")),
            ),
          );
        }
      },
    );
  }
}
