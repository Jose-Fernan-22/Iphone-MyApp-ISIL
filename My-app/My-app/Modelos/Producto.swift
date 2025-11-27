// ARCHIVO: Modelos/Producto.swift

import Foundation

// Define cómo es un producto en nuestra tienda
struct Producto: Identifiable, Hashable {
    // 1. Eliminamos el "= UUID()" para que sea un parámetro requerido.
    let id: UUID
    let nombre: String
    let precio: Double
    let imagenURL: String
    let descripcion: String
    // 2. Quitamos el valor por defecto para que sea un parámetro requerido
    // (Luego le daremos un valor por defecto en el inicializador).
    var esFavorito: Bool

    // 3. Inicializador explícito que permite a la API omitir 'esFavorito' (por defecto es false).
    init(id: UUID, nombre: String, precio: Double, imagenURL: String, descripcion: String, esFavorito: Bool = false) {
        self.id = id
        self.nombre = nombre
        self.precio = precio
        self.imagenURL = imagenURL
        self.descripcion = descripcion
        self.esFavorito = esFavorito
    }
}
