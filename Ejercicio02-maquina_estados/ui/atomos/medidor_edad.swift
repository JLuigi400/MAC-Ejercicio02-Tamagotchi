//
//  medidor_edad.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 30/09/26.
//

import SwiftUI

enum EstadosMedidorEdad {
    case Vacio
    case Mayor
    case Menor
    case Error
}

struct MedidorEdad: View {
    @Binding var campo: String
    @State var estado: EstadosMedidorEdad = .Vacio
    
    var body: some View {
        
        TextField("Por favor coloca tu edad.", text: $campo)
            .onSubmit {
                if campo.isEmpty {
                    estado = .Vacio
                    return
                }
                if let edad_numero = Int(campo) {
                    if edad_numero >= 18 {
                        estado = .Mayor
                    }
                    else {
                        estado = .Menor
                    }
                }
                else {
                    estado = .Error
                }
            }
        
        switch(estado) {
        case .Vacio:
            Text("Por favor, introduce tu edad")
        case .Mayor:
            Text("")
        case .Menor:
            Text("Tu mamà sabe donde estas?")
        case .Error:
            Text("ERROR - ESO NO ES UN NÙMERO")
                .foregroundStyle(Color.red)
        }
    }
}

#Preview {
    @Previewable @State var texto: String = ""
    
    MedidorEdad(campo: $texto)
}
