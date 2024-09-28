import 'package:hive/hive.dart';

class CalcData {
  double number;
  CalcData(this.number);
}

class CalcDataHive extends TypeAdapter<CalcData> {
  @override
  final int typeId = 0;


  @override
  CalcData read(BinaryReader reader) {
    double number = reader.readDouble();

    return CalcData(number);
  }
  
  @override
  void write(BinaryWriter writer, CalcData obj) {
    writer.writeDouble(obj.number);
  }

}
