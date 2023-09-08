import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IMC(),
  ));
}

class IMC extends StatefulWidget {
  const IMC({ Key? key }) : super(key: key);

  @override
  _IMCState createState() => _IMCState();
}

class _IMCState extends State<IMC> {

TextEditingController pesoController = TextEditingController();
TextEditingController alturaController = TextEditingController();
String infor = "Informe seus dados";

void resetCampos(){
  pesoController.text = "";
  alturaController.text = "";
  infor = "Informe seus dados";
}

void calcular(){
  setState(() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);

    if(imc < 18.5){
      infor = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 18.5 && imc <= 24.9){
      infor = "Peso normal(${imc.toStringAsPrecision(3)})";
    }else if (imc >= 25.0 && imc <= 29.9){
      infor = "Sobrepeso(${imc.toStringAsPrecision(3)})";
    }else if (imc >= 30 && imc <= 34.9){
      infor = "Obesidade grau 1(${imc.toStringAsPrecision(3)})";
    } else {
      infor = "Obesidade grau 2(${imc.toStringAsPrecision(3)})";
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Calculadora IMC"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person_outline, size: 120, color: Colors.green,),

            TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (kg)",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
            controller: pesoController,
            ),

            TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura (cm)",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
            controller: alturaController,
            ),

            ElevatedButton(
              onPressed: () {calcular();}, 
              child: Text('Calcular'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(color: Colors.white,fontSize: 25)
              )
              
            ),

            Text("$infor",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25),)
          ],
        ),
      ),
    );
  }
}