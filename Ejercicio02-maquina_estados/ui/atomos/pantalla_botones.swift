//
//  pantalla_botones.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 30/09/26.
//

import SwiftUI

struct PantallaBasica3: View {
    @State var estado_boton: Bool = false
    
    var body: some View {
        BotonesAdvertencia(boton_pulsado: $estado_boton)
    }
}

#Preview {
    PantallaBasica3()
}
