//
//  ProductoService.swift
//  My-app
//
//  Created by user278666 on 11/11/25.
//

import Foundation

class ProductoService {
    
    static let shared = ProductoService()
    private init() {}
    
    func obtenerProductos(completion: @escaping ([Producto]?, String?) -> Void) {
        let endpoint = "https://dummyjson.com/products"
        
        guard let url = URL(string: endpoint) else {
            completion(nil, "Error: URL inválida.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(nil, "Error de red: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, "Error: Respuesta inválida del servidor o código HTTP inesperado.")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: No se recibieron datos.")
                return
            }
            
            do {
                let wrapperDto = try JSONDecoder().decode(ProductosWrapperDto.self, from: data)
                
                // Mapeo de DTOs a Modelos de Dominio Producto
                let productos = wrapperDto.products.map { $0.toDomain() }
                
                completion(productos, nil)
            } catch {
                completion(nil, "Error de decodificación de JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
