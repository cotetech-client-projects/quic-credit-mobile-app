import '/exports/exports.dart';

// global model bottom sheet
void showSheet(
    {List<Map<String, dynamic>>? data, ValueChanged<String>? selected}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]['name']),
                      onTap: () {
                        selected!(data[index]['id'].toString());
                        Routes.popPage();
                      },
                    );
                  });
            });
      });
}

// global function to show a snackbar
void showMessage(String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
  ));
}

// loading dialog
void showLoadingDialog({String? text}) {
  showAdaptiveDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text ?? "Loading...",
                ),
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ],
            )
          ],
        );
      });
}
