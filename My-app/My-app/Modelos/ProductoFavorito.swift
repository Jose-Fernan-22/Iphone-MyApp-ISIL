//
//  ProductoFavorito.swift
//  My-app
//
//  Created by user278666 on 11/26/25.
//

import Foundation
import SwiftData

@Model
class ProductoFavorito {
    @Attribute(.unique) var id: UUID
    var nombre: String
    var precio: Double
    var imagenURL: String
    
    init(id: UUID, nombre: String, precio: Double, imagenURL: String) {
        self.id = id
        self.nombre = nombre
        self.precio = precio
        self.imagenURL = imagenURL
    }
}
