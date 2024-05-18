class BoxData {
  final String text;
  final String imageUrl;

  BoxData({required this.text, required this.imageUrl});
}

final List<BoxData> myBoxData = [
  BoxData(text: "Inventario", imageUrl: "https://cdn-icons-png.flaticon.com/512/1440/1440500.png"),
  BoxData(text: "Catálogo", imageUrl: "https://static.vecteezy.com/system/resources/previews/032/329/070/original/drawing-cartoon-chocolate-cake-cute-dessert-sticker-png.png"),
  BoxData(text: "Gestión de pedidos", imageUrl: "https://cdn-icons-png.flaticon.com/512/6384/6384868.png"),
  BoxData(text: "Registro de usuarios", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/System-users.svg/2048px-System-users.svg.png"),
];