import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://localhost:8080';

  Future<void> saveInventory(String name, String cantidad, String proveedor, String fechaIngreso, String fechaVencimiento) async {
    final url = Uri.parse('$_baseUrl/inventory');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'cantidad': cantidad,
        'proveedor': proveedor,
        'fecha_ingreso': fechaIngreso,
        'fecha_vencimiento': fechaVencimiento,
      }),
    );

    if (response.statusCode == 200) {
      print('Inventario guardado exitosamente');
    } else {
      print('Error: ${response.body}');
      throw Exception('Fallo al guardar el inventario: ${response.body}');
    }
  }

  Future<List<dynamic>> getInventarios() async {
    final url = Uri.parse('$_baseUrl/inventory');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Fallo al obtener los inventarios');
    }
  }
}
