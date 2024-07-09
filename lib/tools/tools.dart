import '/exports/exports.dart';

// global model bottom sheet
void showSheet(
    {List<Map<String, dynamic>>? data,
    ValueChanged<Map<String, dynamic>>? selected}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return ListView.separated(
                itemCount: data!.length,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]['name']),
                    onTap: () {
                      selected!(data[index]);
                      Routes.popPage();
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
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
