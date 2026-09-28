//
//  vista_jeep.swift
//  Ejercicio02-maquina_estados
//
//  Created by alumno on 9/28/26.
//

import SwiftUI

struct VistaJeep: View {
    var texto: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color.teal)
            
            HStack {
                Circle()
                    .foregroundStyle(Color.red)
                Spacer()
                Text(texto)
                Spacer()
                Circle()
                    .foregroundStyle(Color.green)
            }
            .frame(height: 50)
        }
        .frame(height: 75)
    }
}

#Preview {
    VistaJeep(texto: "PlaceHolder")
}
