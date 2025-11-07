//
//  VistaPrincipal.swift
//  My-app
//
//  Created by user278666 on 10/15/25.
//

import SwiftUI

struct VistaPrincipal: View {
    var body: some View {
        TabView {
            // Cada una de estas será una de nuestras pantallas
            VistaHome()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            VistaFavoritos()
                .tabItem {
                    Label("Favoritos", systemImage: "heart.fill")
                }

            VistaCarrito()
                .tabItem {
                    Label("Carrito", systemImage: "cart.fill")
                }
        }
    }
}
