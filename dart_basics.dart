// Student: Raghd Nasr
// Registration Number: 26334
const String regNo = '26334';
final int d = int.parse(regNo[regNo.length - 1]); // Last digit: 4
final int t = int.parse(regNo.substring(regNo.length - 2)); // Last two digits: 34

// B2: Count English vowels (case-insensitive) using a while loop
int countVowels(String text) {
  // Implemented by Raghd Nasr (R.N.)
  String lower = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
    i++;
  }
  return count;
}

// B3: Extract uppercase initials separated by dots
String initials(String fullName) {
  // Implemented by Raghd Nasr (R.N.)
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';

  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += '${parts[i][0].toUpperCase()}.';
    }
    i++;
  }
  return result;
}

// C5: Print a right-aligned triangle (* on odd rows, # on even rows)
void drawTriangle(int height) {
  // Implemented by Raghd Nasr (R.N.)
  if (height <= 0) return;

  int row = 1;
  while (row <= height) {
    String spaces = ' ' * (height - row);
    String symbol = (row % 2 == 1) ? '*' : '#';
    String chars = symbol * row;
    print('$spaces$chars');
    row++;
  }
}

// D2.1: Calculate MoMo transfer fee based on tariff brackets
int momoFee(int amount) {
  // Implemented by Raghd Nasr (R.N.)
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// D2.2: Mask a 10-digit phone number keeping first 3 and last 2 digits
String maskPhone(String phone) {
  // Implemented by Raghd Nasr (R.N.)
  if (phone.length != 10) return 'INVALID';
  String firstThree = phone.substring(0, 3);
  String lastTwo = phone.substring(phone.length - 2);
  return '$firstThree*****$lastTwo';
}

void main() {
  print('Reg no: $regNo | D=$d | T=$t');

  // B2 test
  String myName = 'Raghd Nasr';
  int vowelCount = countVowels(myName);
  print('$myName has $vowelCount vowels');

  // B3 tests
  print(initials(myName));
  print(initials('  ana   uwase  '));
  print(initials(''));

  // C5 tests
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2: MoMo receipt printer using a while loop
  int i = 1;
  int totalFees = 0;
  String phone = '0788123456';
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}