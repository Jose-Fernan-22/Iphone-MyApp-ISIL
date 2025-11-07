//
//  ItemCarrito.swift
//  My-app
//
//  Created by user278666 on 10/15/25.
//

import Foundation

// Define un ítem dentro del carrito de compras
struct ItemCarrito: Identifiable {
    let id = UUID()
    var producto: Producto
    var cantidad: Int
}
