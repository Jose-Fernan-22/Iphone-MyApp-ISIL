//
//  EncabezadoHomeVista.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//
import SwiftUI

struct EncabezadoHomeVista: View {
    var body: some View {
        VStack {
            // Fila superior con Título y Botones
            HStack {
                Text("Kynlee") // El nombre de la tienda en el diseño
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {}) { Image(systemName: "bell") }
                Button(action: {}) { Image(systemName: "cart") }
            }
            .font(.title2)
            
            // Barra de Búsqueda
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Busca lo que necesitas...")
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.15))
            .cornerRadius(15)
        }
        .foregroundColor(.black)
    }
}
