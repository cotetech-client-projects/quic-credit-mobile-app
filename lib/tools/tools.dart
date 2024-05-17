import '/exports/exports.dart';

// global model bottom sheet
void showSheet(List<Map<String, dynamic>> data, ValueChanged<String> selected) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]['name']),
                      onTap: () {
                        selected(data[index]['name']);
                        Routes.popPage();
                      },
                    );
                  });
            });
      });
}
