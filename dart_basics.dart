// Student: Raghd Nasr
// Reg no: 26334
const String regNo = '26334';
final int $d = int.parse(regNo[regNo.length - 1]); // D = 4
final int $t = int.parse(regNo.substring(regNo.length - 2)); // T = 34

/*
  ====================================================================
  PART B2 & B3, PART C5, AND PART D2 IMPLEMENTATION
  ====================================================================
*/

// by RN
int countVowels(String text) {
  int count = 0;
  String lower = text.toLowerCase();
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

// by RN
String initials(String fullName) {
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';
  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (var part in parts) {
    if (part.isNotEmpty) {
      result += '${part[0].toUpperCase()}.';
    }
  }
  return result;
}

// by RN
void drawTriangle(int height) {
  if (height <= 0) return;
  int i = 1;
  while (i <= height) {
    String spaces = '';
    int s = 0;
    while (s < height - i) {
      spaces += ' ';
      s++;
    }
    
    String chars = '';
    String symbol = (i % 2 != 0) ? '*' : '#';
    int c = 0;
    while (c < i) {
      chars += symbol;
      c++;
    }
    
    print(spaces + chars);
    i++;
  }
}

// by RN
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by RN
String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';
  return '${phone.substring(0, 3)}*****${phone.substring(8)}';
}

void main() {
  print('Reg no: $regNo | D=$d | T=$t');
  
  // Test B2
  String myName = 'Raghd Nasr';
  int vowelsCount = countVowels(myName);
  print('$myName has $vowelsCount vowels');
  
  // Test B3
  print(initials('Raghd Nasr'));
  print(initials(' ana uwase '));
  
  // Test C5 (height = D + 3 = 7)
  print('--- Triangle (Height: ${$d + 3}) ---');
  drawTriangle($d + 3);
  
  // Test D2 MoMo Receipts
  print('--- MoMo Receipts ---');
  int i = 1;
  int totalFees = 0;
  while (i <= $d + 3) {
    int amount = i * 4000 + $t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    String masked = maskPhone('0788123456');
    print('Receipt $i $amount RWF | fee $fee RWF | to $masked');
    i++;
  }
  print('Total fees: $totalFees RWF');
}

/*
  ====================================================================
  TRACE ANSWERS & PREDICTIONS (FOR PARTS A, B1, C1-C4, D1)
  ====================================================================

  --- PART A1 ---
  - print(a / b); -> 3.4 (Division in Dart returns a double).
  - print(a ~/ b); -> 3 (Integer division truncates the decimal part).
  - print(a % b); -> 2 (Remainder of 17 divided by 5).
  - print(-a % b); -> 3 (In Dart, remainder takes the sign of the divisor or follows specific modulo rules where -17 % 5 = 3).
  - print(-a ~/ b); -> -3 (Truncating division towards zero).
  - print(-17.abs()); -> -17 (Absolute value is 17, then negated).
  - print(0.1 + 0.2 == 0.3); -> false (Floating-point precision issue).
  - print(10 == 10.0); -> true (Numeric equality in Dart equates 10 and 10.0).

  --- PART A2 (Personal with D=4, T=34) ---
  - int x = 4; int y = 34;
  - var z = x * 2 + y ~/ 4; -> 4 * 2 = 8, 34 ~/ 4 = 8, z = 8 + 8 = 16.
  - z += x; -> z = 16 + 4 = 20.
  - print(z); -> 20
  - print(z.isEven); -> true
  - print('$z' + '$x'); -> "204" (String concatenation).
  - Type of z is int. Dart worked it out via type inference from the expression's result type.

  --- PART B1 ---
  - city.length -> 6
  - city[city.length - 1] -> 'i'
  - city.substring(2, 4) -> 'ga'
  - city.toUpperCase().indexOf('A') -> 1
  - city.contains('k') -> false (case-sensitive)
  - '$city.length' -> "Kigali.length"
  - '${city.length}' -> "6"
  - city * 2 -> Error / Not supported directly like Python for strings in standard Dart unless specified, but wait: in Dart multiplying a string by an int is a compile-time error.
  - city.toUpperCase(); -> 'KIGALI' (but city itself remains immutable 'Kigali').
  - city.replaceAll('i', '!') -> 'Kĭgal!'
  - '5' + 5.toString() -> '55'
  - int.parse('5') + 5 -> 10

  --- PART C1 ---
  - Loops from i=0 to 5. When i=2, continue skips print. When i=4, break stops loop. Prints: 0, 1, 3.

  --- PART C2 ---
  - day=2 prints 'Early week'. If day=1, due to fall-through in switch cases without break, it also prints 'Early week'. Java/C programmers expect fall-through unless break is used, but modern Dart requires explicit breaks or allows empty cases to fall through automatically.

  --- PART C3 ---
  - bonus ?? 50 -> 50
  - bonus ??= 70 -> bonus becomes 70
  - bonus ??= 90 -> stays 70
  - do-while loop with n=10 condition n<10 prints 10 once because check happens at the end.

  --- PART C4 (D=4) ---
  - x=4. x is even, adds 'E', x becomes 1. Next iteration x=1 is odd, adds 'O', x becomes -2. Loop ends. result = 'EO'. length = 2. result[0] = 'E'.

  --- PART D1 ---
  - Global vs local scope of count. doubleIt passes value by value (primitive types in Dart are immutable/passed by value). addVat default parameter. 999 18% calculation integer division.
*/