class MetalModel {
  var symbol;
  var open_time;
  var price;
  var ch;

// Constructor
  MetalModel({
    required this.ch,
    required this.open_time,
    required this.price,
    required this.symbol,
  });

// namedConstructor
  factory MetalModel.fromJson({required json}) {
    return MetalModel(
      ch: json["ch"],
      open_time: json["open_time"],
      price: json["price"],
      symbol: json["symbol"],
    );
  }
}
