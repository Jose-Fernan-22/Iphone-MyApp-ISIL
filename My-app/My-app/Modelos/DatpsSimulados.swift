//
//  DatpsSimulados.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//

import Foundation

// Nuestra colección de productos de muestra para la tienda
struct DatosSimulados {
    static let productos: [Producto] = [
        Producto(nombre: "Essence Mascara Lash Princess",
                 precio: 9.99,
                 imagenURL: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
                 descripcion: "La máscara de pestañas Essence Lash Princess False Lash Effect te da un look audaz de pestañas postizas sin la molestia. ¡Es la favorita de los influencers de belleza!"),
        
        Producto(nombre: "Eyeshadow Palette with Mirror",
                 precio: 19.99,
                 imagenURL: "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/thumbnail.webp",
                 descripcion: "Esta paleta de sombras de ojos de 15 colores es perfecta tanto para principiantes como para profesionales. Incluye un práctico espejo para retoques sobre la marcha."),
        
        Producto(nombre: "Powder Canister",
                 precio: 14.99,
                 imagenURL: "https://cdn.dummyjson.com/product-images/beauty/powder-canister/thumbnail.webp",
                 descripcion: "Un envase de polvos sueltos recargable y portátil que es perfecto para viajar. Mantiene tu maquillaje fresco y mate durante todo el día."),
        
        Producto(nombre: "Royal Blue Premium Watch",
                 precio: 59.99,
                 imagenURL: "https://cdn.dummyjson.com/product-images/mens-watches/royal-blue-premium-watch/thumbnail.webp",
                 descripcion: "Un reloj premium de color azul real con un diseño elegante y moderno. Perfecto para cualquier ocasión, desde reuniones de negocios hasta salidas casuales.")
    ]
}
