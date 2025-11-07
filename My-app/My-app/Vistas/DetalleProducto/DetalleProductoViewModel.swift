//
//  DetalleProductoViewModel.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//

import Foundation

// ObservableObject permite que las vistas observen sus cambios.
class DetalleProductoViewModel: ObservableObject {
    // @Published notifica a la vista cada vez que 'cantidad' cambia.
    @Published var cantidad: Int = 1

    func incrementarCantidad() {
        cantidad += 1
    }

    func decrementarCantidad() {
        // Nos aseguramos de que la cantidad no baje de 1.
        if cantidad > 1 {
            cantidad -= 1
        }
    }
}
