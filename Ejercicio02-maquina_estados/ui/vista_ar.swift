//
//  vista_ar.swift
//  Ejercicio02-maquina_estados
//
//  Created by alumno on 9/25/26.
//

import SwiftUI
import RealityKit

struct VistaAR: View {
    var body: some View {
        RealityView{ contenido in
            contenido.camera = .spatialTracking
            
            let imagen_ar = AnchorEntity(.image(group: "archivos_ar", name: "recurso_1"))
            
            let cajita = ModelEntity(mesh: .generateBox(size: 0.1))
            cajita.model?.materials = [SimpleMaterial(color: .red, isMetallic: true)]
            
            cajita.setParent(imagen_ar)
            
            contenido.add(imagen_ar)
        }
        .gesture(
            SpatialTapGesture()
                .targetedToAnyEntity()
                .onEnded{ valor in
                    print("Hey, parece que has pulsado a \(valor.entity.name)")
                    
                }
        )
    }
}

struct PantallaSecundaria: View {
    var entidad: Entity?
    
    var body: some View {
        Text("HOLA MUNDO MI REFERENCIA ES \(entidad?.name)")
    }
}
