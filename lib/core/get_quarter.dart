extension GetQuarter on DateTime {
  String getQuarter() {
    switch (month) {
      case 0:
      case 1:
      case 2:
        return '1';
        break;
      case 3:
      case 4:
      case 5:
        return '2';
        break;
      case 6:
      case 7:
      case 8:
        return '3';
        break;
      case 9:
      case 10:
      case 11:
        return '4';
        break;
      default:
        return '0';
    }
  }
}
