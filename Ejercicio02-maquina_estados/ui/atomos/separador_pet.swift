//
//  separador_pet.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 07/10/26.
//

import SwiftUI

struct SeparadorPET: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 30, height: 5)
            Rectangle()
                .frame(width: 10, height: 5)
            Rectangle()
                .frame(width: 50, height: 5)
            Spacer()
            Rectangle()
                .frame(width: 30, height: 5)
            Rectangle()
                .frame(width: 10, height: 5)
            Rectangle()
                .frame(width: 50, height: 5)
            Spacer()
            Rectangle()
                .frame(width: 30, height: 5)
            Rectangle()
                .frame(width: 10, height: 5)
            Rectangle()
                .frame(width: 50, height: 5)
            Spacer()
        }
        .foregroundStyle(Color("PETAzul"))
    }
}
