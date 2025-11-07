//
//  VistaHome.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//

import SwiftUI

struct VistaHome: View {
    let columnas = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 1. Nuevo Encabezado
                    EncabezadoHomeVista()
                    
                    // 2. Banner Promocional (lo mantenemos)
                    BannerVista()
                    
                    // 3. Nueva lista de Categorías
                    CategoriasVista()
                    
                    // 4. Título de la sección
                    HStack {
                        Text("Popular").font(.title).fontWeight(.bold)
                        Spacer()
                        Text("Ver todo").foregroundColor(.secondary)
                    }
                    
                    // 5. La Grilla de Productos
                    LazyVGrid(columns: columnas, spacing: 20) {
                        ForEach(DatosSimulados.productos) { producto in
                            NavigationLink(destination: VistaDetalleProducto(producto: producto)) {
                                TarjetaProductoVista(producto: producto)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding()
            }
            .navigationBarHidden(true) // Ocultamos la barra de navegación original
        }
    }
}
