// Student: Raghd Nasreldeen Abdelazim Osman
// Reg no: 26334
const String regNo = '26334';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count Vowels
int countVowels(String text) {
  // by RN
  int count = 0;
  String lowerText = text.toLowerCase();

  for (int i = 0; i < lowerText.length; i++) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
  }

  return count;
}

// B3: Initials
String initials(String fullName) {
  // by RN
  String trimmedName = fullName.trim();

  if (trimmedName.isEmpty) {
    return '';
  }

  List<String> names = trimmedName.split(RegExp(r'\s+'));
  String result = '';

  for (String name in names) {
    result += name[0].toUpperCase() + '.';
  }

  return result;
}

// C5: Draw Triangle
void drawTriangle(int height) {
  // by RN
  if (height <= 0) {
    return;
  }

  int row = 1;

  while (row <= height) {
    String line = '';
    int spaces = 0;

    while (spaces < height - row) {
      line += ' ';
      spaces++;
    }

    int symbols = 0;

    while (symbols < row) {
      if (row % 2 == 0) {
        line += '#';
      } else {
        line += '*';
      }
      symbols++;
    }

    print(line);
    row++;
  }
}

// D2: MoMo Fee
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

// D2: Mask Phone
String maskPhone(String phone) {
  // by RN
  if (phone.length != 10) {
    return 'INVALID';
  }

  return phone.substring(0, 3) +
      '*****' +
      phone.substring(8);
}

// Main Function
void main() {
  // by RN
  print('Reg no: $regNo | D = $d | T = $t');

  // B2 tests
  String fullName = 'Raghd Nasreldeen Abdelazim Osman';

  print('$fullName has ${countVowels(fullName)} vowels');

  // B3 tests
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5 tests
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2 tests
  String phone = '0788123456';
  int totalFees = 0;
  int i = 1;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}',
    );

    i++;
  }

  print('Total fees: $totalFees RWF');
}