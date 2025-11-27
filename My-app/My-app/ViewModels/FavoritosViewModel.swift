//
//  FavoritosViewModel.swift
//  My-app
//
//  Created by user278666 on 10/15/25.
//

import Foundation
import SwiftData
import SwiftUI

class FavoritosViewModel: ObservableObject {
    // Mantenemos esta lista publicada para que la UI se actualice
    @Published var productosFavoritos: [Producto] = []

    // Función para cargar los favoritos desde la base de datos al iniciar o actualizar
    func cargarFavoritos(context: ModelContext) {
        let descriptor = FetchDescriptor<ProductoFavorito>()
        do {
            let datosGuardados = try context.fetch(descriptor)
            // Convertimos de ProductoFavorito (Base de datos) a Producto (Tu modelo normal)
            self.productosFavoritos = datosGuardados.map { item in
                Producto(
                    id: item.id,
                    nombre: item.nombre,
                    precio: item.precio,
                    imagenURL: item.imagenURL,
                    descripcion: "" // No guardamos descripción en favoritos para ahorrar espacio, o puedes agregarla si quieres
                )
            }
        } catch {
            print("Error al cargar favoritos: \(error)")
        }
    }

    func esFavorito(producto: Producto) -> Bool {
        return productosFavoritos.contains(where: { $0.id == producto.id })
    }

    func alternarFavorito(producto: Producto, context: ModelContext) {
        if esFavorito(producto: producto) {
            // Eliminar de SwiftData
            eliminarFavorito(producto: producto, context: context)
        } else {
            // Agregar a SwiftData
            let nuevoFavorito = ProductoFavorito(
                id: producto.id,
                nombre: producto.nombre,
                precio: producto.precio,
                imagenURL: producto.imagenURL
            )
            context.insert(nuevoFavorito)
        }
        
        // Guardar cambios y recargar la lista
        do {
            try context.save()
            cargarFavoritos(context: context)
        } catch {
            print("Error al guardar en SwiftData: \(error)")
        }
    }
    
    private func eliminarFavorito(producto: Producto, context: ModelContext) {
        // Buscar el objeto exacto en la base de datos para borrarlo
        let idBuscado = producto.id
        let descriptor = FetchDescriptor<ProductoFavorito>(predicate: #Predicate { $0.id == idBuscado })
        
        do {
            if let objetoABorrar = try context.fetch(descriptor).first {
                context.delete(objetoABorrar)
            }
        } catch {
            print("Error al intentar borrar: \(error)")
        }
    }
}
