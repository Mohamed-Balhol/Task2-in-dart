import 'dart:io';

abstract class LibraryOperations {
  void addingboook();
  void searchbook(String value);
  void deletebook(String name);
}

//start Book class
class Book {
  String _title;
  String _author;
  String _publicationYear;

  Book({
    required String title,
    required String author,
    required String publicationYear,
  }) : _title = title,
       _author = author,
       _publicationYear = publicationYear;
  //geterr
  String get title => _title;
  String get author => _author;
  String get publicationYear => _publicationYear;
  //seterr
  set title(String t) => _title = t;
  set author(String a) => _author = a;
  set publicationYear(String y) => _publicationYear = y;
}

//end Book class

//---------------------

//start User class
class User {
  final String _name;
  final int _membershipNumber;
  final List<Book> _borrowedBooks = [];

  User(String name, int membershipNumber)
    : _name = name,
      _membershipNumber = membershipNumber;
  //geterr
  String get name => _name;
  int get membershipNumber => _membershipNumber;
  List<Book> get borrowedBooks => _borrowedBooks;
}
//end User class

//-----------------------

//start NormalMembers class extends from Usar class
class NormalMembers extends User {
  NormalMembers(super.name, super.membershipNumber);
}

//end NormalMembers class extends from Usar class
//--------------------
//start PremiumMembers class extends from Usar class
class PremiumMembers extends User {
  PremiumMembers(super.name, super.membershipNumber);
}
//end PremiumMembers class extends from Usar class

//------------------------

// start library Class
class Library implements LibraryOperations {
  Book book = Book(
    title: 'The richest man in Babylon',
    author: 'Gorge Klason',
    publicationYear: '1926',
  );

  Book book1 = Book(
    title: 'My beloved Isis',
    author: 'Hajar Abdul Samad',
    publicationYear: '2015',
  );

  Set<Book> books = {};

  Library() {
    books = {book, book1};
  }

  void printbook() {
    if (books.isEmpty) {
      print("Imsorry this Library is empty");
    } else {
      for (var book in books) {
        print(book.title);
        print('\n');
      }
    }
  }

  @override
  void addingboook() {
    String title;
    String author;
    String publicationYear;
    print('Enter the Tile of Book');
    title = stdin.readLineSync()!;
    print('Enter the author of Book');
    author = stdin.readLineSync()!;
    print('Enter the publicationYear of Book');
    publicationYear = stdin.readLineSync()!;
    Book newbook = Book(
      title: title,
      author: author,
      publicationYear: publicationYear,
    );
    books.add(newbook);
  }

  @override
  void searchbook(String value) {
    bool found = false;
    for (var book in books) {
      if (book.title == value ||
          book.author == value ||
          book.publicationYear == value) {
        print("This Book is excites");
        found = true;
      }
    }
    if (!found) {
      print("the Book is not found!");
    }
  }

  @override
  void deletebook(String name) {
    books.removeWhere((book) => book.title == name);
    print("Book deleted successfully\n");
  }
}

// end Library class
//------------------

//Main
void main() {
  Library lib = Library();
  while (true) {
    print("Welcome to Almutaheda Library\n");
    lib.printbook();
    print("Adding Book Enter :1\n");
    print("Searchion Book Enter :2\n");
    print("Deleting Book Enter :3\n");
    print("To Exit Enter 4\n");
    dynamic chose, serch, name;

    chose = stdin.readLineSync();
    switch (chose) {
      case '1':
        lib.addingboook();
        break;
      case '2':
        print('Enter Title of book or author or publicationYear');
        serch = stdin.readLineSync();
        lib.searchbook(serch);
        break;
      case '3':
        print('Enter Title of book for deleting!');
        name = stdin.readLineSync();
        lib.deletebook(name);
        break;
      case '4':
        print('nice to meet you');
        exit(1);

      default:
        print("Enter the correct number");
        break;
    }
  }
}
