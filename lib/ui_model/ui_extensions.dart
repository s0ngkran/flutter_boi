import 'bill/ui_bill.dart';

extension MyUiBill on UiBill {
  double? getPriceBill() {
    return 0;
    // return this.orders?.fold(
    //   0.0,
    //   (previousValue, element) => (element.getPriceOrder() ?? 0.0) + (previousValue as double),
    // );
  }
}
