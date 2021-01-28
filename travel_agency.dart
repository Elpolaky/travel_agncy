import 'dart:io';


class Customer {
  var id, passengerLimit, price, location, discount,customerReserve;
  int num=0 ;

  DateTime date;
  List <String> trip = [];

  void addTrip() {
    print('Enter ( ID ) of the trip please :');
    id = '[ id : ${stdin.readLineSync()} ';
    print('Enter ( day ) of the trip please :');
    int day = int.parse(stdin.readLineSync());
    print('Enter ( month ) of the trip please :');
    int month = int.parse(stdin.readLineSync());
    print('Enter ( year ) of the trip please :');
    int year = int.parse(stdin.readLineSync());
    date = new DateTime(year, month, day);

    print('Enter ( Location ) of the trip please :');
    location = 'location : ${stdin.readLineSync()} ';

    print('Enter ( passenger limit ) of the trip please :');
    passengerLimit = stdin.readLineSync();
    print('Enter ( price ) of the trip please :');
    price = stdin.readLineSync();
    if (int.parse(price) >= 10000) {
      discount = 'Price after discount : ${int.parse(price) * (20 / 100)} ]';
    }
    else {
      discount = 'Price : $price ]';
    }

    trip.addAll([id, 'date : ${date.toString()}', location, passengerLimit, discount]);
  }

  void edit() {
    print(trip);
    print('please Enter the ID of the trip you want to edit :');
    id = stdin.readLineSync().toString();
    var k = trip.indexWhere((element) => element.contains(id));

    print('if you want to edit the id enter 1 ');
    print('if you want to edit the date enter 2 ');
    print('if you want to edit the location enter 3 ');
    print('if you want to edit the passenger limit enter 4 ');
    print('if you want to edit the price enter 5 ');

    int num = int.parse(stdin.readLineSync());

    if (num == 1) {
      trip.removeAt(k);
      print('enter the new id : ');
      var value = stdin.readLineSync();
      trip.insert(k, '[ id : $value ');
    } else if (num == 2) {
      trip.removeAt(k + 1);
      print('Now you can enter the new date : ');
      print('Enter day of the trip please : ');
      int day = int.parse(stdin.readLineSync());
      print('Enter month of the trip please : ');
      int month = int.parse(stdin.readLineSync());
      print('Enter year of the trip please : ');
      int year = int.parse(stdin.readLineSync());
      var value = DateTime(year, month, day);
      trip.insert(k + 1, 'date : $value ');
    } else if (num == 3) {
      trip.removeAt(k + 2);
      print('enter the new Location');
      var value = stdin.readLineSync();
      trip.insert(k + 2, 'location : $value ');
    } else if (num == 4) {
      trip.removeAt(k + 3);
      print('enter the new passenger limit ');
      var value = stdin.readLineSync();
      trip.insert(k + 3, value);
    } else if (num == 5) {
      trip.removeAt(k + 4);
      print('enter the new price');
      var value = stdin.readLineSync();
      if (int.parse(value) >= 10000) {
        value = 'Price after discount : ${int.parse(value) * (20 / 100)} ]';
      }
      trip.insert(k + 4, 'price : $value ]');
    } else {
      print('Try again please :(');
    }
    print('the trip was edited successfully ;)');
  }

  void delete() {
    print(trip);
    print('Please Enter the Id of the trip you want to delete :');

    var id = stdin.readLineSync();
    var k = trip.indexWhere((element) => element.contains(id));

    trip.removeRange(k, k + 5);
    print('the trip was deleted successfully ;)');
  }

  void view() {
    print(trip);
  }

  void search() {
    print('Enter the price of the trip please ');
    price = stdin.readLineSync();
    int k = trip.indexWhere((element) => element.contains(price));
    if (k == -1){
      print('there is no trip with that price');
    }
    else {
      for (int i = k-4 ; i <= k; i++) {
        print(trip[i]);
      }
    }
  }

  void reserve() {
    print(trip);
    print('Enter the ID of the trip you want to reserve :');
    var x = stdin.readLineSync();
    int k = trip.indexWhere((element) => element.contains(x));

      print('Enter the number of passengers that want to reserve');
      int b = num+int.parse(stdin.readLineSync());
      if ( b > int.parse(trip[k+3])) {
        print('Sorry no place for this number :( ');
      }
      else {
        num=b ;
        print('the trip has been reserved successfully ;) ');
      }

  }

  void latestTrips() {
    if (trip.length <= 50) {
      view();
    }
    else {
      for (int i = trip.length - 50; i <= trip.length; i++) {
        print(trip[i]);
      }
    }
  }


}

void main() {
  Customer a = new Customer();
  try {
    bool z = true;
    while (z) {
      print(
          '------------------------------------------------------------------------');
      print('To Add a trip enter [1]');
      print('To Edit a trip enter [2]');
      print('To Delete a trip enter [3]');
      print('To View trips enter [4]');
      print('To Search of a trip by its price enter [5]');
      print('To reserve a trip  [6]');
      print('To Show last trips  [7]');
      print('To Exit Enter [8]');

      print(
          '------------------------------------------------------------------------');
      var num = stdin.readLineSync();
      if (num == '1') {
        print(
            '------------------------------------------------------------------------');
        a.addTrip();
        print(
            '-------------------------------------------------------------------------');
      }

      if (num == '2') {
        print(
            '-------------------------------------------------------------------------');
        a.edit();
        print(
            '-------------------------------------------------------------------------');
      }
      if (num == '3') {
        print(
            '-------------------------------------------------------------------------');
        a.delete();
        print(
            '-------------------------------------------------------------------------');
      }
      if (num == '4') {
        print(
            '-------------------------------------------------------------------------');
        a.view();
        print(
            '-------------------------------------------------------------------------');
      }

      if (num == '5') {
        print(
            '-------------------------------------------------------------------------');
        a.search();
        print(
            '-------------------------------------------------------------------------');
      }
      if (num == '6') {
        print(
            '-------------------------------------------------------------------------');
        a.reserve();
        print(
            '-------------------------------------------------------------------------');
      }
      if (num == '7') {
        print(
            '-------------------------------------------------------------------------');
        a.latestTrips();
        print(
            '-------------------------------------------------------------------------');
      }
      if (num == '8') {
        print(
            '-------------------------------------------------------------------------');
        z = false;
        print(
            '-------------------------------------------------------------------------');
      }
    }
  }
  catch (e){
    main();
  }
}