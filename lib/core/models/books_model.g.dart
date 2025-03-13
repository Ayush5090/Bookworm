// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksAdapter extends TypeAdapter<Books> {
  @override
  final int typeId = 0;

  @override
  Books read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Books(
      authorKey: (fields[0] as List?)?.cast<String>(),
      authorName: (fields[1] as List?)?.cast<String>(),
      coverEditionKey: fields[2] as String?,
      coverId: fields[3] as int?,
      editionCount: fields[4] as int?,
      firstPublishYear: fields[5] as int?,
      hasFulltext: fields[6] as bool?,
      key: fields[7] as String?,
      title: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Books obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.authorKey)
      ..writeByte(1)
      ..write(obj.authorName)
      ..writeByte(2)
      ..write(obj.coverEditionKey)
      ..writeByte(3)
      ..write(obj.coverId)
      ..writeByte(4)
      ..write(obj.editionCount)
      ..writeByte(5)
      ..write(obj.firstPublishYear)
      ..writeByte(6)
      ..write(obj.hasFulltext)
      ..writeByte(7)
      ..write(obj.key)
      ..writeByte(8)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
