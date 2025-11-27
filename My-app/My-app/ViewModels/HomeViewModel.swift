//
//  HomeViewModel.swift
//  My-app
//
//  Created by system on 07/11/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var productos: [Producto] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let productoService = ProductoService.shared
    
    // Propiedad para el total de productos para la nueva vista desplegable
    var totalProductos: Int {
        productos.count
    }
    
    init() {
        obtenerProductos()
    }
    
    func obtenerProductos() {
        isLoading = true
        errorMessage = nil
        
        productoService.obtenerProductos { [weak self] productos, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let productos = productos {
                    self?.productos = productos
                } else if let error = error {
                    self?.errorMessage = error
                }
            }
        }
    }
}