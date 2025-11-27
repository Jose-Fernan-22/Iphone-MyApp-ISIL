//
//  VistaFavoritos.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//
import SwiftUI

struct VistaFavoritos: View {
    // Obtenemos acceso al ViewModel de favoritos
    @EnvironmentObject var favoritosViewModel: FavoritosViewModel
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationView {
            // Verificamos si la lista de favoritos está vacía
            if favoritosViewModel.productosFavoritos.isEmpty {
                // VISTA PARA CUANDO NO HAY FAVORITOS
                VStack {
                    Image(systemName: "heart.slash.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text("No tienes favoritos")
                        .font(.headline)
                        .padding(.top)
                }
                .navigationTitle("Mis Favoritos")
            } else {
                // VISTA PARA CUANDO SÍ HAY FAVORITOS
                List(favoritosViewModel.productosFavoritos) { producto in
                    // Fila para cada producto favorito
                    HStack(spacing: 15) {
                        AsyncImage(url: URL(string: producto.imagenURL)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text(producto.nombre)
                                .font(.headline)
                            Text("S/ \(producto.precio, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .navigationTitle("Mis Favoritos")
            }
        }.onAppear{
            favoritosViewModel.cargarFavoritos(context: context)
        }
        
    }
        
}
