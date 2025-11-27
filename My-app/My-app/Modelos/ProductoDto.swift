//
//  ProductoDto.swift
//  My-app
//
//  Created by system on 07/11/25.
//

import Foundation

// Estructura para decodificar la respuesta principal de la API
struct ProductosWrapperDto: Decodable {
    let products: [ProductoDto]
}

// Estructura para decodificar cada producto
struct ProductoDto: Decodable {
    let id: Int
    let title: String // Se mapea a 'nombre'
    let description: String // Se mapea a 'descripcion'
    let price: Double
    let images: [String] // Se mapea a 'imagenURL' (tomando la primera)
}

// Extensión para mapear el DTO al modelo de dominio Producto
extension ProductoDto {
    func toDomain() -> Producto {
        // Se genera un UUID basado en el ID del servidor para asegurar la unicidad y compatibilidad
        let uuid = UUID(uuidString: "00000000-0000-0000-0000-\(String(format: "%012X", id))") ?? UUID()
        
        return Producto(
            id: uuid,
            nombre: title,
            precio: price,
            imagenURL: images.first ?? "",
            descripcion: description
        )
    }
}
