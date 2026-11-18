// Student: Raghd Nasreldeen Abdelazim Osman
// Reg no: 26334
const String regNo = '26334';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// by RN
int momoFee(int amount) {
  // by RN
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// by RN
String formatRwf(int amount) {
  // by RN
  bool negative = amount < 0;
  String number = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = number.length - 1;

  while (i >= 0) {
    result = number[i] + result;
    count++;

    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }

    i--;
  }

  if (negative) {
    result = '-' + result;
  }

  return result + ' RWF';
}

// by RN
bool isValidPin(String pin) {
  // by RN
  if (pin.length != 5) {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (int.tryParse(pin[i]) == null) {
      return false;
    }
    i++;
  }

  if (pin == '12345') {
    return false;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }

  return true;
}

// by RN
int sendMoney(int balance, int amount) {
  // by RN
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// by RN
int buyAirtime(int balance, int amount) {
  // by RN
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime bought ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// by RN
void main() {
  // by RN
  print('Reg no: $regNo | D = $d | T = $t');

  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('48214'));

  int balance = 20000 + t * 500;

  print('Starting balance: ${formatRwf(balance)}');

  int amount = (d + 1) * 3000;

  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // Additional tests

  print(formatRwf(0));        // Expected: 0 RWF
  print(formatRwf(999));      // Expected: 999 RWF
  print(formatRwf(1000));     // Expected: 1,000 RWF
  print(formatRwf(1250000));  // Expected: 1,250,000 RWF
  print(formatRwf(-5000));    // Expected: -5,000 RWF

  print(isValidPin('54321')); // Expected: true
  print(isValidPin('11111')); // Expected: false
}