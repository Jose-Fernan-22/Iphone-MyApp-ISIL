//
//  BannerVista.swift
//  My-app
//
//  Created by user278666 on 10/16/25.
//

import SwiftUI

struct BannerVista: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Oferta Especial")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("¡25% de descuento!")
                    .font(.headline)
                
                Button("Comprar ahora") {
                    // Acción del botón en el futuro
                }
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.black)
                .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
    }
}
