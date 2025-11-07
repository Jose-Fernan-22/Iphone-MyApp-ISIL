//
//  CategoriasVista.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//
import SwiftUI

struct CategoriasVista: View {
    // Datos de ejemplo para las categorías
    let categorias = ["Shoes", "Fashion", "Food", "Electronic", "Sport"]
    @State private var categoriaSeleccionada = "Fashion"

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(categorias, id: \.self) { categoria in
                    Button(action: { categoriaSeleccionada = categoria }) {
                        Text(categoria)
                            .fontWeight(categoriaSeleccionada == categoria ? .bold : .regular)
                            .foregroundColor(categoriaSeleccionada == categoria ? .white : .black)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(categoriaSeleccionada == categoria ? Color.black : Color.clear)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}
