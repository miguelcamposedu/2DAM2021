class LuzModel {
  LuzModel({required this.name, required this.price, required this.logo, required this.phone, required this.workTime});
  String name;
  double price;
  String logo;
  String phone;
  String workTime;
}

final companiasLuz = [
  LuzModel(name: 'Naturgy', price: 0.24, logo: 'naturgy.svg', phone: '900100251', workTime: 'Llámanos de lunes a sábado - de 8:00h a 22:00h'),
  LuzModel(name: 'Endesa', price: 0.24, logo: 'naturgy.svg', phone: '900100251', workTime: 'Llámanos de lunes a sábado - de 8:00h a 22:00h'),
  LuzModel(name: 'Iberdrola', price: 0.24, logo: 'naturgy.svg', phone: '900100251', workTime: 'Llámanos de lunes a sábado - de 8:00h a 22:00h'),
];