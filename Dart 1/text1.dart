
String processPayment(dynamic payment) {
  if (payment is Map) {
    payment
      ..['amount'] = 100
      ..['currency'] = payment['currency'] ?? 'USD';
    double rate = payment['currency'] == 'USD' ? 1 : 30;
    double total = payment['amount'] * rate;
    return payment['method'] == 'Card'
        ? 'Paid by card: \$${total}'
        : payment['method'] == 'Cash'
            ? 'Paid by cash: \$${total}'
            : 'Unknown payment method';
  }

  return 'Invalid payment';
}

void main() {
  print(processPayment({'method': 'Card'}));                   
  print(processPayment({'method': 'Cash', 'currency': 'EGP'})); 
  print(processPayment({'method': 'Paypal'}));                
}
