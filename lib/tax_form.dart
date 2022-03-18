import 'package:flutter/material.dart';

class TaxForm extends StatefulWidget {
  const TaxForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return TaxFormState();
  }

}

class TaxFormState extends State<TaxForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child:
        Column(
          children: [
            TextFormField(
              validator: (value){
                final onlyNumbers = RegExp(r'^-?[0-9]+$');

                if(value!=null &&onlyNumbers.hasMatch(value)){
                  return null;
                } else{
                  return 'Please only enter numbers';
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                  );
                }
                },
              child: const Text('Submit'),
            ),
            )
          ],
        ),
    );
  }
}