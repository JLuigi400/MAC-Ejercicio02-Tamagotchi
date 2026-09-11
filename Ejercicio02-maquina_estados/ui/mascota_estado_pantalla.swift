//
//  mascota_estado_pantalla.swift
//  Ejercicio02-maquina_estados
//
//  Created by alumno on 9/11/26.
//

import SwiftUI

struct MascotaEstado: View {
    @Environment(ControladorGeneral.self) var mascota
    
    var body: some View {
        switch(mascota.estado) {
        case .Neutro:
            Rectangle()
                .foregroundStyle(Color.gray)
        case .Hambriento:
            Rectangle()
                .foregroundStyle(Color.orange)
        case .Inanicion:
            Rectangle()
                .foregroundStyle(Color.red)
        case .Muerte:
            Text("Ya dejalo, esta muerto")
                .fontWidth(.expanded)
                .fontWeight(.heavy)
        default:
            Text("Es un misterio...")
        }
        
    }
}

#Preview {
    MascotaEstado()
        .environment(ControladorGeneral())
}
