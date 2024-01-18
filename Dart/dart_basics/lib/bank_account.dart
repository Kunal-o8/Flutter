class BankAccount {
  String accountHolder;
  double _balance;

  BankAccount(this.accountHolder, double initialBalance)
      : _balance = initialBalance;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposit of $amount successful. New balance: $balance");
    } else {
      print("Invalid deposit amount.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrawal of $amount successful. New balance: $balance");
    } else {
      print("Invalid withdrawal amount or insufficient funds.");
    }
  }
}

void main() {
  BankAccount account1 = BankAccount("Alice", 1000);
  BankAccount account2 = BankAccount("Bob", 500);

  print("\nInitial Account Balances:");
  print("${account1.accountHolder}'s balance: \$${account1.balance}");
  print("${account2.accountHolder}'s balance: \$${account2.balance}");

  account1.deposit(200);
  account1.withdraw(50);

  account2.deposit(300);
  account2.withdraw(200);

  print("\nFinal Account Balances:");
  print("${account1.accountHolder}'s balance: \$${account1.balance}");
  print("${account2.accountHolder}'s balance: \$${account2.balance}");
}
