void main() {
  var a = "Learning"; //Khai báo kiểu ngầm định
  //a = 2; Lỗi vì biến a đã được khởi tạo bởi kiểu String

  dynamic b = "22";
  b = 2; // Được vì dynamic là kiểu linh hoạt
  print(a);

  // Hằng số
  final c = 2; // Run-time constant, rebuild lại mỗi khi ctrinh rebuild
  const d = "3"; // Complile-time constant, ko rebuild lại, cần phải gán ngay từ đầu

  // If, else, vòng lặp tương tự vs các ngôn ngữ khác

  late int e; // Khởi tạo muộn, giống lateinit trong Kotlin
  e = 5;
}