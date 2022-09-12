import 'package:dependent_dropdown/my_widget.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int jens_id = 1;
  String? selectedOstanId;
  String? selectedShahrId;
  List<dynamic> ostan = [];
  List<dynamic> filterShahr = [];
  List<dynamic> shahr = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ostan.add({"id": 1, "name": "تهران"});
    ostan.add({"id": 2, "name": "البرز"});
    shahr.add({"id": 1, "name": "قدس", "ostanId": 1});
    shahr.add({"id": 2, "name": "اسلامشهر", "ostanId": 1});
    shahr.add({"id": 3, "name": "فردیس", "ostanId": 2});
    shahr.add({"id": 4, "name": "کرج", "ostanId": 2});
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: MediaQuery.of(context).size.width < 600
                ? MediaQuery.of(context).size.width
                : 600,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                MyWidgets.dropDownWidget(
                    context, "استان را انتخاب کنید", selectedOstanId, ostan,
                        (onChangedVal) {
                      setState(() {
                        selectedOstanId = onChangedVal! ?? "";
                        selectedShahrId = null;
                        filterShahr = shahr
                            .where((element) =>
                        element['ostanId'].toString() ==
                            selectedOstanId.toString())
                            .toList();
                        print(selectedShahrId);
                      });
                    }, (onValidateVal) {
                  if (onValidateVal == null) {
                    return "استان را انتخاب کنید";
                  }
                  return null;
                },
                    borderFocusColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    borderRadius: 10,
                    optionValue: "id",
                    optionLabel: "name"),
                const SizedBox(
                  height: 30,
                ),

                MyWidgets.dropDownWidget(
                    context, "شهر را انتخاب کنید", selectedShahrId, filterShahr,
                        (onChangedVal) {
                      setState(() {
                        selectedShahrId = onChangedVal;
                      });
                    }, (onValidateVal) => null,
                    borderFocusColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    borderRadius: 10,
                    optionValue: "id",
                    optionLabel: "name"),
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'آی دی استان: ${selectedOstanId}',
                  style: const TextStyle(fontSize: 24.0),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'آی دی شهر: ${selectedShahrId}',
                  style: const TextStyle(fontSize: 24.0),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
