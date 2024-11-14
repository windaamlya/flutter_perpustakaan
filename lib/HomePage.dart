import 'package:flutter/material.dart';
// import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  _BookListPageState createState() =>_BookListPageState();

}

class  _BookListPageState extends State<BookListPage> {
  List<Map<String, dynamic>> books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final response = await Supabase.instance.client
        .from('books')
        .select();

        setState(() {
          books = List<Map<String, dynamic>>.from(response);
        });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        actions: [
          IconButton(
          icon: Icon(Icons.refresh),
          onPressed: fetchBooks,
          )
        ],
      ),
      body: books.isEmpty
          ? Center(child: CircularProgressIndicator()) 
          : ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return ListTile(
              title: Text(book['title']?? 'No Title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(book['author'] ?? 'No Author', style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                Text(book['description'] ?? 'No Description', style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic)),
              ]
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   IconButton(icon: Icon(Icons.edit, color: Colors.blue),
                   onPressed: (){
                   Navigator.pop(context);
                },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
                ]
              ),
              );
            }
      ),
    );
  }
}
