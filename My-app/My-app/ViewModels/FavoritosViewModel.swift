//
//  FavoritosViewModel.swift
//  My-app
//
//  Created by user278666 on 10/15/25.
//

import Foundation

class FavoritosViewModel: ObservableObject {
    @Published var productosFavoritos: [Producto] = []

    func esFavorito(producto: Producto) -> Bool {
        productosFavoritos.contains(where: { $0.id == producto.id })
    }

    func alternarFavorito(producto: Producto) {
        if esFavorito(producto: producto) {
            productosFavoritos.removeAll { $0.id == producto.id }
        } else {
            productosFavoritos.append(producto)
        }
    }
}
