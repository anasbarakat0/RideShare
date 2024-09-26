import 'package:flutter/material.dart';
import 'package:rideshare_/colors.dart';
import 'package:rideshare_/text_button.dart';

Widget togglePassword(bool value, void Function(bool) onChanged) {
  return IconButton(
    onPressed: () {
      onChanged(!value);
    },
    icon: !value
        ? const Icon(Icons.visibility_outlined)
        : const Icon(Icons.visibility_off_outlined),
    color: Colors.grey,
  );
}

void errorMessage(BuildContext context, String titel, List<String> messages) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titel),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: List.generate(messages.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red[100]),
                    child: ListTile(
                      title: Text(
                        messages[index],
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: BorderButton(
                text: "Back",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      );
    },
  );
}

void infoMessage(BuildContext context, String titel, List<String> messages) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titel),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: List.generate(messages.length, (index) {
                return ListTile(
                  title: Text(
                    messages[index],
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: BorderButton(
                text: "Ok",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      );
    },
  );
}

void functionDialog(
    BuildContext context, void Function(bool) read, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF414141),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 320,
              height: 54,
              child: Button(
                text: "Lets Go",
                onPressed: () {
                  read(true);
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              height: 54,
              child: WhiteButton(
                text: 'Cancel',
                onPressed: () {
                  read(false);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

void deletingDialog(
    BuildContext context, void Function(bool) read, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF414141),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 320,
              height: 54,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  read(true);
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromRGBO(211, 47, 47, 1)),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              height: 54,
              child: WhiteButton(
                text: 'Cancel',
                onPressed: () {
                  read(false);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
