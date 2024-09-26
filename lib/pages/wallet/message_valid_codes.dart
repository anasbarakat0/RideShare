import 'package:flutter/material.dart';
import 'package:rideshare_/model/wallet/get_codes_model.dart';
import 'package:rideshare_/text_button.dart';

void showValidCodes(BuildContext context, List<Body> codesBody,
    void Function(String code) useCode) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Valid Codes"),
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(codesBody.length, (index) {
                      return ListTile(
                        isThreeLine: true,
                        title: Text(
                          codesBody[index].code,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text("${codesBody[index].amount.toString()} S.P"),
                        trailing: IconButton.filled(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color((0xFF08B783))),
                          ),
                          onPressed: () {
                            useCode(codesBody[index].code);
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.play_arrow),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                width: 320,
                height: 54,
                child: Button(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      });
}
