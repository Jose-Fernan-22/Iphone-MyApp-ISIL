//
//  CarritoViewModel.swift
//  My-app
//
//  Created by user278666 on 10/15/25.
//

import Foundation

class CarritoViewModel: ObservableObject {
    @Published var items: [ItemCarrito] = []

    var total: Double {
        items.reduce(0) { $0 + ($1.producto.precio * Double($1.cantidad)) }
    }

    func agregarProducto(_ producto: Producto, cantidad: Int) {
        if let indice = items.firstIndex(where: { $0.producto.id == producto.id }) {
            items[indice].cantidad += cantidad
        } else {
            items.append(ItemCarrito(producto: producto, cantidad: cantidad))
        }
    }
    
    func elimiminarItems(en offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
