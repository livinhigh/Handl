class DummyOrders {
  final List<Map<String, dynamic>> _orders = [
    {'id': '12345','orderNumber': 'Order #12345', 'status': 'On Time', 'timeLeft': 5},
    {'id': '67890','orderNumber': 'Order #67890', 'status': 'Delayed', 'timeLeft': -2},
    {'id': '54321','orderNumber': 'Order #54321', 'status': 'On Time', 'timeLeft': 3},
  ];
  List<Map<String, dynamic>> get orders => _orders;
  
   final Map<String, List<Map<String, String>>> _orderDetails = {
    '#12345': [
      {"Tea": "1","id":"1"},
      {"Fries": "1","id":"2"},
      {"Cola": "1","id":"3"},
    ],
    '#67890': [
      {"Item2": "1","id":"4"},
      {"Item3": "1","id":"5"},
      {"Item4": "1","id":"6"},
    ],
    '#54321': [
      {"Item5": "1","id":"7"},
      {"Item6": "1","id":"8"},
      {"Item7": "1","id":"9"},
    ],
  };
  Map<String, List<Map<String, String>>> get orderDetails => _orderDetails;
}
