//
//  VistaTotalProductos.swift
//  My-app
//
//  Created by system on 07/11/25.
//

import SwiftUI

struct VistaTotalProductos: View {
    let total: Int
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "box.truck.fill")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding(.bottom, 10)

                Text("Productos en el Inventario")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Actualmente tienes **\(total)** productos disponibles en la tienda.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Inventario")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
        // Limita el tamaño del modal a un tercio de la pantalla
        .presentationDetents([.fraction(0.3)])
    }
}