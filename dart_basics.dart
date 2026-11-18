
// Student: Ndisanze Girimpundu Vanessa
// Reg no: 26251
const String regNo = '26251';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels in a name
int countVowels(String text) {
  // by VNG
  int count = 0;
  String name = text.toLowerCase();

  int i = 0;
  while (i < name.length) {
    if ('aeiou'.contains(name[i])) {
      count++;
    }
    i++;
  }

  return count;
}

// B3: Get initials from a full name
String initials(String fullName) {
  // by VNG
  String name = fullName.trim();

  if (name.isEmpty) {
    return '';
  }

  List<String> words = name.split(RegExp(r'\s+'));
  String result = '';

  int i = 0;
  while (i < words.length) {
    result += '${words[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

// C5: Draw a right-aligned triangle
void drawTriangle(int height) {
  // by VNG
  int row = 1;

  while (row <= height) {
    String spaces = '';
    String symbols = '';

    int j = 0;
    while (j < height - row) {
      spaces += ' ';
      j++;
    }

    String symbol = row.isEven ? '#' : '*';

    int k = 0;
    while (k < row) {
      symbols += symbol;
      k++;
    }

    print(spaces + symbols);
    row++;
  }
}

// D2: Calculate the MoMo transaction fee
int momoFee(int amount) {
  // by VNG
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

// D2: Hide part of a phone number
String maskPhone(String phone) {
  // by VNG
  if (phone.length != 10) {
    return 'INVALID';
  }

  String hiddenNumber = '';

  int i = 3;
  while (i < phone.length - 2) {
    hiddenNumber += '*';
    i++;
  }

  return phone.substring(0, 3) +
      hiddenNumber +
      phone.substring(phone.length - 2);
}

// Part E: Corrected grade function
String grade(int mark) {
  // by VNG
  if (mark >= 80) {
    return 'A';
  } else if (mark >= 70) {
    return 'B';
  } else if (mark >= 50) {
    return 'C';
  }

  return 'F';
}

// Part E: Check whether a word is a palindrome
bool isPalindrome(String word) {
  // by VNG
  String text = word.toLowerCase();

  int i = 0;
  while (i < text.length ~/ 2) {
    if (text[i] != text[text.length - 1 - i]) {
      return false;
    }
    i++;
  }

  return true;
}

// Main program
void main() {
  // by VNG
  print('Reg no: $regNo | D = $d | T = $t');

  // B2: Count vowels
  String fullName = 'Ndisanze Girimpundu Vanessa';

  print(
    '$fullName has ${countVowels(fullName)} vowels'
  );

  // B3: Print initials
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5: Draw triangles
  print('\nTriangle:');
  drawTriangle(d + 3);

  print('\nTriangle with height 0:');
  drawTriangle(0);

  print('\nTriangle with height -2:');
  drawTriangle(-2);

  // D2: Print MoMo receipts
  String phone = '0788123456';
  int totalFees = 0;
  int i = 1;

  print('\nMoMo Receipts:');

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}'
    );

    i++;
  }

  print('Total fees: $totalFees RWF');

  // Part E: Testing the corrected functions
  print('\nPart E:');
  print('grade(85): ${grade(85)}');
  print('grade(75): ${grade(75)}');
  print('grade(45): ${grade(45)}');

  print('level: ${isPalindrome('level')}');
  print('Level: ${isPalindrome('Level')}');
  print('hello: ${isPalindrome('hello')}');
}
