//
//  TarjetaProductoVista.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//

import SwiftUI

struct TarjetaProductoVista: View {
    let producto: Producto
    // Obtenemos acceso al ViewModel para poder interactuar con él
    @EnvironmentObject var favoritosViewModel: FavoritosViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // ---- INICIO DEL CAMBIO ----
            ZStack(alignment: .topTrailing) {
                // La imagen del producto que ya teníamos
                AsyncImage(url: URL(string: producto.imagenURL)) { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // El nuevo botón de corazón
                Button(action: {
                    favoritosViewModel.alternarFavorito(producto: producto)
                }) {
                    Image(systemName: favoritosViewModel.esFavorito(producto: producto) ? "heart.fill" : "heart")
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding(8)
                        .background(.white.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding(10) // Espaciado desde el borde de la imagen
            }
            // ---- FIN DEL CAMBIO ----
            
            Text(producto.nombre)
                .font(.headline)
                .lineLimit(1)
            
            Text("S/ \(producto.precio, specifier: "%.2f")")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
    }
}
