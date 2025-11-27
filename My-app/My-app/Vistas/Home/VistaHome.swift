//
//  VistaHome.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//

import SwiftUI

struct VistaHome: View {
    let columnas = [GridItem(.flexible()), GridItem(.flexible())]
    
    // Acceso al HomeViewModel para obtener productos (Punto 3)
    @EnvironmentObject var homeViewModel: HomeViewModel
    // Estado para mostrar el modal de productos (Nueva Solicitud)
    @State private var mostrarModalProductos = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 1. Encabezado con el nuevo botón
                    EncabezadoHomeVista() //
                        // Añadimos un botón al lado del carrito para la nueva vista (Punto 2)
                        .overlay(alignment: .topTrailing) {
                            Button(action: {
                                mostrarModalProductos = true
                            }) {
                                Image(systemName: "list.bullet.rectangle.portrait")
                            }
                            .offset(x: -65, y: -2) 
                            .font(.title2)
                            .foregroundColor(.black)
                        }
                    
                    // 2. Banner Promocional
                    BannerVista() //
                    
                    // 3. Lista de Categorías
                    CategoriasVista() //
                    
                    // 4. Título de la sección
                    HStack {
                        Text("Popular").font(.title).fontWeight(.bold)
                        Spacer()
                        Text("Ver todo").foregroundColor(.secondary)
                    }
                    
                    // 5. La Grilla de Productos - Manejo de estado de carga y error (Punto 3)
                    if homeViewModel.isLoading {
                        ProgressView("Cargando productos...")
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else if let error = homeViewModel.errorMessage {
                        VStack(spacing: 15) {
                            Text("Error al cargar: \(error)")
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                            Button("Reintentar") {
                                homeViewModel.obtenerProductos()
                            }
                            .buttonStyle(.borderedProminent).tint(.black)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)

                    } else {
                        LazyVGrid(columns: columnas, spacing: 20) {
                            ForEach(homeViewModel.productos) { producto in // Se usa data del ViewModel
                                NavigationLink(destination: VistaDetalleProducto(producto: producto)) {
                                    TarjetaProductoVista(producto: producto) //
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
                .padding()
            }
            // Navegación (Punto 1)
            .navigationBarHidden(true)
            .sheet(isPresented: $mostrarModalProductos) {
                // Muestra la vista desplegable con el total de productos (Nueva Solicitud)
                VistaTotalProductos(total: homeViewModel.totalProductos)
            }
        }
    }
}
