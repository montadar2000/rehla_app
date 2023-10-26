import 'package:get/get.dart';
class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ProgressControllerDetails extends GetxController{

  List<SalesData> data = [
    SalesData('exam 1', 91),
    SalesData('exam 2', 94),
    SalesData('exam 3', 81),
    SalesData('exam 4', 61),
    SalesData('exam 5', 20),



  ];
  List examsList=[
    {"note":"good job",
      "mark":91,
      "date":"9/3/2023",
      "exam":"exam1",

    },
    {"note":"good job",
      "mark":94,
      "date":"9/3/2023",
      "exam":"exam2",

    },   {"note":"good job",
      "mark":81,
      "date":"9/3/2023",
      "exam":"exam3",

    },   {"note":"good job",
      "mark":61,
      "date":"9/3/2023",
      "exam":"exam4",

    },   {"note":"bad",
      "mark":20,
      "date":"9/3/2023",
      "exam":"exam5",

    },
  ];
}