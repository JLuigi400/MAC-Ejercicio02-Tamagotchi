//
//  bindable.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 30/09/26.
//

import SwiftUI
///import RealityKit

struct BotonAdvertencia: View {
    @Binding var boton_pulsado: Bool
    var mensaje_inicial: String = "ERROR 404"
    var mensaje_final: String = "ERROR 404"
    
    var body: some View {
        Button{
            if(!boton_pulsado){
                boton_pulsado = true
            }
        }
        label: {
            if(boton_pulsado){
                VStack{
                    Text(mensaje_final)
                }
                .foregroundStyle(Color.black)
                .frame(width: 250, height: 150)
                .background(Color.red)
            }
            else {
                VStack{
                    Text(mensaje_inicial)
                }
                .foregroundStyle(Color.red)
                .frame(width: 250, height: 150)
                .background(Color.black)
            }

        }
        .buttonStyle(.plain)
    }
}


#Preview {
    @Previewable @State var boton = false
    
    VStack{
        BotonAdvertencia(boton_pulsado: $boton, mensaje_inicial: "HOLA", mensaje_final: "ADIOS")
        BotonAdvertencia(boton_pulsado: $boton)
        BotonAdvertencia(boton_pulsado: $boton)
        BotonAdvertencia(boton_pulsado: $boton)
    }
}
