

class SubscriptionModel{
 final String? id;
 final int subscriptionDays;
 final String subscriptionName;
 final double amount;

 SubscriptionModel({this.id, required this.subscriptionDays, required this.subscriptionName, required this.amount});

 factory SubscriptionModel.fromJSON(Map<String, dynamic> json) {
  return SubscriptionModel(
   id: json["_id"],
   subscriptionDays: json["subscriptionDays"],
   subscriptionName: json["subscriptionName"],
   amount: json["amount"]

  );
 }
 // String id;
//String subscriptionDays;
  //String subscriptionName;
// Int amount;
 Map<String, dynamic> toJson() {
  return {

   "subscriptionDays":subscriptionDays,
   "subscriptionName":subscriptionName,
   "amount":amount
  };
 }


}
//

