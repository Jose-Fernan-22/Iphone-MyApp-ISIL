//
//  VistaDetalleProducto.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//
import SwiftUI

struct VistaDetalleProducto: View {
    let producto: Producto
    @StateObject private var viewModel = DetalleProductoViewModel()
    @EnvironmentObject var carritoViewModel: CarritoViewModel
    @EnvironmentObject var favoritosViewModel: FavoritosViewModel
    @State private var tallaSeleccionada = "M"
    let tallas = ["XS", "S", "M", "L", "XL"]

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Imagen del producto
                    AsyncImage(url: URL(string: producto.imagenURL)) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: { ProgressView() }
                    .frame(height: 300)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)

                    // Nombre y botón de favoritos
                    HStack {
                        Text(producto.nombre).font(.title2).fontWeight(.bold)
                        Spacer()
                        Button(action: { favoritosViewModel.alternarFavorito(producto: producto) }) {
                            Image(systemName: favoritosViewModel.esFavorito(producto: producto) ? "heart.fill" : "heart")
                                .foregroundColor(.red).font(.title2)
                        }
                    }

                    // Selector de Talla
                    VStack(alignment: .leading) {
                        Text("Talla:").font(.headline)
                        HStack {
                            ForEach(tallas, id: \.self) { talla in
                                Button(action: { tallaSeleccionada = talla }) {
                                    Text(talla)
                                        .frame(width: 50, height: 50)
                                        .background(tallaSeleccionada == talla ? .black : Color.gray.opacity(0.2))
                                        .foregroundColor(tallaSeleccionada == talla ? .white : .black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }

                    // Descripción
                    Text(producto.descripcion).font(.body).foregroundColor(.secondary)
                    
                    // Control de cantidad (Requerido por el examen)
                    HStack {
                        Text("Cantidad:").font(.headline)
                        Spacer()
                        Button(action: viewModel.decrementarCantidad) { Image(systemName: "minus.circle.fill") }
                        Text("\(viewModel.cantidad)").font(.title3).fontWeight(.bold)
                        Button(action: viewModel.incrementarCantidad) { Image(systemName: "plus.circle.fill") }
                    }.font(.title)
                }
                .padding()
            }
            
            // Botón inferior de compra
            Button(action: {
                carritoViewModel.agregarProducto(producto, cantidad: viewModel.cantidad)
            }) {
                Text("Agregar por S/ \((producto.precio * Double(viewModel.cantidad)), specifier: "%.2f")")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .padding()
        }
        .navigationTitle("Producto")
        .navigationBarTitleDisplayMode(.inline)
    }
}
