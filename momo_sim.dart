
// Student: Ndisanze Girimpundu Vanessa
// Reg no: 26251
const String regNo = '26251';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Calculate MoMo transaction fees
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

// Format an amount with commas and RWF
String formatRwf(int amount) {
  // by VNG
  bool negative = amount < 0;
  String number = amount.abs().toString();

  String reversed = '';
  int i = number.length - 1;

  while (i >= 0) {
    reversed += number[i];

    if (i > 0 && i % 3 == 0) {
      reversed += ',';
    }

    i--;
  }

  String result = reversed.split('').reversed.join('');

  if (negative) {
    result = '-$result';
  }

  return '$result RWF';
}

// Checking whether a PIN is valid
bool isValidPin(String pin) {
  // by VNG
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;
  while (i < pin.length) {
    if (pin[i].compareTo('0') < 0 ||
        pin[i].compareTo('9') > 0) {
      return false;
    }
    i++;
  }

  bool sameDigits = true;
  i = 1;

  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      sameDigits = false;
      break;
    }
    i++;
  }

  if (sameDigits) {
    return false;
  }

  return true;
}

// Sending money from one account to another
int sendMoney(int balance, int amount) {
  // using VNG
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
    'New balance: ${formatRwf(newBalance)}'
  );

  return newBalance;
}

// Buying airtime without paying a transaction fee
int buyAirtime(int balance, int amount) {
  // by VNG
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime bought: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}'
  );

  return newBalance;
}

// The main program
void main() {
  // by VNG
  print('Reg no: $regNo | D = $d | T = $t');

  // Test different PIN values
  print('\nPIN validation:');
  print('12345: ${isValidPin('12345')}');
  print('77777: ${isValidPin('77777')}');
  print('4821: ${isValidPin('4821')}');
  print('48a21: ${isValidPin('48a21')}');
  print('4821$d: ${isValidPin('4821$d')}');

  // Setting the starting balance
  int balance = 20000 + t * 500;

  print('\nStarting balance: ${formatRwf(balance)}');

  // Send money three times
  int amount = (d + 1) * 3000;

  int i = 1;
  while (i <= 3) {
    print('\nSend transaction $i:');
    balance = sendMoney(balance, amount);
    i++;
  }

  // Buying airtime
  print('\nAirtime transaction:');
  balance = buyAirtime(balance, 1000);

  // Try sending an invalid amount
  print('\nInvalid transaction:');
  balance = sendMoney(balance, 0);

  // Try sendinging more money than the balance
  print('\nLarge transaction:');
  balance = sendMoney(balance, 200000);

  // Displaying final balance
  print('\nFinal balance: ${formatRwf(balance)}');

  // Additional tests for formatRwf
  print('\nAdditional formatRwf tests:');

  print(formatRwf(0));          // expected: 0 RWF
  print(formatRwf(999));        // expected: 999 RWF
  print(formatRwf(1000));       // expected: 1,000 RWF
  print(formatRwf(1250000));    // expected: 1,250,000 RWF
  print(formatRwf(-5000));      // expected: -5,000 RWF
  print(formatRwf(123456789));  // expected: 123,456,789 RWF

  // Additional tests for isValidPin
  print('\nAdditional isValidPin tests:');

  print(isValidPin('54321'));  // expected: true
  print(isValidPin('11111'));  // expected: false
  print(isValidPin('12345'));  // expected: false
  print(isValidPin('12a45'));  // expected: false
  print(isValidPin('123456')); // expected: false
  print(isValidPin('00012'));  // expected: true
}
