//
//  VistaCarrito.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//

import SwiftUI

struct VistaCarrito: View {
    @EnvironmentObject var carritoViewModel: CarritoViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                if carritoViewModel.items.isEmpty {
                    VStack {
                        Image(systemName: "cart")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("Tu carrito esta vacio")
                            .font(.headline)
                            .padding(.top)
                    }
                } else {
                    // Si hay items, muestra la lista
                    List{
                        ForEach(carritoViewModel.items) { item in
                            //Fila para cada item del carrito
                            HStack(spacing: 15) {
                                AsyncImage(url: URL(string: item.producto.imagenURL)) { image in
                                    image.resizable().aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    Text(item.producto.nombre).font(.headline)
                                    Text("Cantidad: \(item.cantidad)").font(.subheadline)
                                    Text("S/ \(item.producto.precio, specifier: "%.2f")")
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                        }
                        .onDelete(perform: carritoViewModel.eliminarItems)// Este sera la magia del swipe-to-delete
                    }
                    
                    //Resumen del total y boton de Pagar
                    VStack(spacing:15) {
                        HStack {
                            Text("Total:")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Text("S/ \(carritoViewModel.total, specifier: "%.2f")")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        Button("Pagar ahora") {
                            //Este boton es solo visual
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Mi Carrito")
        }
    }
}
