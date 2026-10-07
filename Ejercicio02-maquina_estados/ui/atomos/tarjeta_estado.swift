//
//  tarjeta_estado.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 07/10/26.
//

import SwiftUI

struct TarjetaEstado: View {

    var titulo: String
    var valor: Int

    var body: some View {

        VStack {

            Text(titulo)
                .foregroundStyle(Color("PETAzul"))

            Text("\(valor)")
                .foregroundStyle(Color("PETTexto"))
        }
        .frame(width: 130, height: 60)
        .background(Color("PETPanelClaro"))
    }
}

#Preview {
    TarjetaEstado(
        titulo: "HAMBRE",
        valor: 50
    )
}
