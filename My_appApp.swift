//
//  My_appApp.swift
//  My-app
//
//  Created by user278666 on 10/15/25.
//

import SwiftUI
import SwiftData

@main
struct My_app: App {
    // Creamos una única instancia de nuestros ViewModels
    @StateObject private var carritoViewModel = CarritoViewModel()
    @StateObject private var favoritosViewModel = FavoritosViewModel()
    @StateObject private var homeViewModel = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            // La VistaPrincipal y todas sus sub-vistas tendrán acceso a los ViewModels
            VistaPrincipal()
                .environmentObject(carritoViewModel)
                .environmentObject(favoritosViewModel)
                .environmentObject(homeViewModel) 
        }
        .modelContainer(for: ProductoFavorito.self)
    }
}
