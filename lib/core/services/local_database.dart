import 'package:bookworm/core/constants/constants.dart';
import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/core/models/user_model.dart';
import 'package:hive/hive.dart';

/// Singleton class for local database
class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._internal();
  factory LocalDatabase() => _instance;

  static Box<UserModel>? userBox; // User Box
  static Box<Books>? wishListBox; // Books user want to read
  static Box<Books>? currentlyReadingBooksBox; // Currently reading books

  LocalDatabase._internal() {
    openLocalDB();
  }

  static Future<void> openLocalDB() async {
    wishListBox = await Hive.openBox(
      Constants.wishlistBoxKey,
      compactionStrategy: (entries, deletedEntries) =>
          deletedEntries >
          10, // Compact (clean up) the database only if more than 10 deleted entries exist.
    );

    currentlyReadingBooksBox = await Hive.openBox(
      Constants.readingBoxKey,
      compactionStrategy: (entries, deletedEntries) => deletedEntries > 10,
    );

    userBox = await Hive.openBox(
      Constants.userBoxKey,
      compactionStrategy: (entries, deletedEntries) => deletedEntries > 10,
    );
  }

  static Future<void> closeLocalDb() async {
    await wishListBox?.close();
    await currentlyReadingBooksBox?.close();
    await userBox?.close();
  }

  static Future<void> addToWishlistBox(Books book) async {
    await wishListBox?.put(book.coverId, book);
  }

  static List<Books>? getWishlistBooks() {
    return wishListBox?.values.toList();
  }

  static Future<void> deleteFromWishlist(int id) async {
    await wishListBox?.delete(id);
  }

  static Future<void> addToCurrentlyReadingBox(Books book) async {
    await currentlyReadingBooksBox?.put(book.coverId, book);
  }

  static List<Books>? getCurrentlyReadingBooks() {
    return currentlyReadingBooksBox?.values.toList();
  }

  static Future<void> deleteFromCurrentlyReadingBox(int id) async {
    await currentlyReadingBooksBox?.delete(id);
  }

  static Future<void> saveOrUpdateUser(UserModel user) async {
    await userBox?.put('user', user);
  }

  static UserModel? getUser() {
    return userBox?.get('user');
  }
}
