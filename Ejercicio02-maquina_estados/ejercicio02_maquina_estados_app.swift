//
//  Ejercicio02_maquina_estadosApp.swift
//  Ejercicio02-maquina_estados
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

@main
struct MaquinaEstadosApp: App {
    @State var control: ControladorGeneral = ControladorGeneral()
    var body: some Scene {
        WindowGroup {
            PantallaInicial()
                .environment(control)
        }
    }
}
