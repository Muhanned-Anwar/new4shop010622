
class CustomerImage {
  late String image;
  late int customerId;
  late int id;

  CustomerImage.fromJson(Map<String, dynamic> json){
    image = json['image'];
    customerId = json['customer_id'];
    id = json['id'];
  }
}