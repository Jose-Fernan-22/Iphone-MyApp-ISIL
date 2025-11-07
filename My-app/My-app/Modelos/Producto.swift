//
//  Producto.swift
//  My-app
//
//  Created by user278666 on 10/15/25.
//
import Foundation

// Define cómo es un producto en nuestra tienda
struct Producto: Identifiable, Hashable {
    let id = UUID() // Identificador único para cada producto
    let nombre: String
    let precio: Double
    let imagenURL: String
    let descripcion: String
    var esFavorito: Bool = false
}
