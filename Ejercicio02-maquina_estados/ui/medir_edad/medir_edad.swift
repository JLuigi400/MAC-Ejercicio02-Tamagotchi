//
//  medir_edad.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 30/09/26.
//

import SwiftUI

enum EstadosErroresUI{
    case Vacio(leyenda: String) // Es usado para idnicar que tenemos una situacion de un campo vacio y que quermeos decir en ese momento
    case Error(leyenda: String) // Es para idnicar una leyenda al comoteer un error
    
    case Aceptado // Todo bien
    case Denegado // Aunque no hay error, las condiciones no permiten continuar. Es menor, tiene una Q en su nombre.... Cualquier cosa
}

struct Leyenda: View {
    var estado: EstadosErroresUI = .Error(leyenda: "Te falta indicar esta leyenda")
    
    var body: some View {
        switch(estado){
            case .Vacio(let leyenda):
                Text(leyenda)
                
            case .Error(let leyenda):
                Text(leyenda)
                    .foregroundStyle(Color.red)
                    .backgroundStyle(Color.black)
                    .fontWeight(.bold)
                
            case .Aceptado:
                Text("Todo okay")
                
            case .Denegado:
                Text("NADA OKAY")
                    .foregroundStyle(Color.red)
        }
    }
}

struct MedirEdad: View {
    @Binding var texto: String
    @Binding var estado: EstadosErroresUI
    
    var body: some View {
        TextField("Colcoa tu edad", text: $texto)
            .onSubmit {
                if texto.isEmpty{
                    estado = .Vacio(leyenda: "POr favor colcoa tu edad en numeros")
                    return
                }
                if let edad_numero = Int(texto){
                    if edad_numero >= 18{
                        estado = .Aceptado
                    }
                    else {
                        estado = .Denegado
                    }
                }
                else {
                    estado = .Error(leyenda: "ESO NO ES UN NUMERO")
                }
            }
    }
}

#Preview{
    @Previewable @State var texto: String = ""
    @Previewable @State var estado: EstadosErroresUI = .Vacio(leyenda: "HOLA")
    
    MedirEdad(texto: $texto, estado: $estado)
    Leyenda(estado: estado)
}
