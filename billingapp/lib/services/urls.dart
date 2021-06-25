String baseURL = "https://541d5e9e2343.ngrok.io";

String noimage = "https://avatars.githubusercontent.com/u/76422147?s=200&v=4";

class FormateDateTime {
// 'assets/icons/misc.png',
// 'assets/icons/ambulence.png'
// 'assets/icons/ipd.png',
// 'assets/icons/opd.png',
// 'assets/icons/pharmacy.png',
  static String getClearText(String val) {
    String type;

    switch (val) {
      case 'ph':
        type = 'assets/icons/pharmacy.png';

        break;
      case 'ip':
        type = 'assets/icons/ipd.png';

        break;
      case 'op':
        type = 'assets/icons/opd.png';

        break;
      case 'mi':
        type = 'assets/icons/misc.png';

        break;
      case 'am':
        type = 'assets/icons/ambulence.png';

        break;
    }

    return type;
  }

  static String getMonthInt(int month) {
    String months = "Jan";

    switch (month) {
      case 1:
        months = "Jan";
        break;
      case 2:
        months = "Feb";
        break;
      case 3:
        months = "March";
        break;
      case 4:
        months = "April";
        break;
      case 5:
        months = "May";
        break;
      case 6:
        months = "June";
        break;
      case 7:
        months = "July";
        break;
      case 8:
        months = "Aug";
        break;
      case 9:
        months = "Sept";
        break;
      case 10:
        months = "Oct";
        break;
      case 11:
        months = "Nov";
        break;
      case 12:
        months = "Dec";
        break;
    }
    return months;
  }
}
