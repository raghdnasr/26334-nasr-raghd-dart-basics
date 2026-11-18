// Student: Raghd Nasr
// Reg no: 26334
const String regNo = '26334';
final int $d = int.parse(regNo[regNo.length - 1]); // D = 4
final int $t = int.parse(regNo.substring(regNo.length - 2)); // T = 34

// by RN
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by RN
String formatRwf(int amount) {
  bool isNegative = amount < 0;
  String s = amount.abs().toString();
  String result = '';
  int count = 0;
  
  int i = s.length - 1;
  while (i >= 0) {
    result = s[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }
    i--;
  }
  return '${isNegative ? '-' : ''}$result RWF';
}

// by RN
bool isValidPin(String pin) {
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  
  bool allDigits = true;
  bool allSame = true;
  int i = 0;
  while (i < pin.length) {
    if (pin[i].codeUnitAt(0) < 48 || pin[i].codeUnitAt(0) > 57) {
      allDigits = false;
    }
    if (pin[i] != pin[0]) {
      allSame = false;
    }
    i++;
  }
  return allDigits && !allSame;
}

// by RN
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - (amount + fee);
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by RN
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000 || amount > balance) {
    print('Failed: invalid airtime amount or insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  print('Reg no: $regNo | D=$d | T=$t');
  
  // 1. Test isValidPin with D = 4
  print('Pin 12345: ${isValidPin('12345')}'); // false
  print('Pin 77777: ${isValidPin('77777')}'); // false
  print('Pin 4821: ${isValidPin('4821')}');   // false
  print('Pin 48a21: ${isValidPin('48a21')}'); // false
  print('Pin 48214: ${isValidPin('48214')}'); // true
  
  // 2. Starting balance = 20000 + T * 500
  int balance = 20000 + $t * 500;
  print('Starting balance: ${formatRwf(balance)}');
  
  // 3. Send (D+1)*3000 three times, buy 1000 airtime, send 0, send 200000
  int sendAmount = ($d + 1) * 3000; 
  int count = 0;
  while (count < 3) {
    balance = sendMoney(balance, sendAmount);
    count++;
  }
  
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);
  
  // 4. Print Final balance
  print('Final balance: ${formatRwf(balance)}');
  
  // 5. Test calls
  // formatRwf(0) -> 0 RWF
  // formatRwf(1000) -> 1,000 RWF
  // formatRwf(1250000) -> 1,250,000 RWF
  // formatRwf(-5000) -> -5,000 RWF
  // isValidPin('00000') -> false
}