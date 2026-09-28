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
        RealityView { contenido in
            // let vista_camara = ARView(frame: .zero)
            contenido.camera = .spatialTracking
            
            let cajita = ModelEntity(mesh: .generateBox(size: 1))
            let imagen_ar = AnchorEntity(.image(group: "archivos_ar", name: "recurso_01"))
            
            cajita.components.set(InputTargetComponent())
            cajita.components.set(CollisionComponent(shapes: [ShapeResource.generateBox(size: SIMD3<Float>(1, 1, 1))]))
            cajita.components.set(HoverEffectComponent())
            
            
            
            cajita.setParent(imagen_ar)
            
            contenido.add(imagen_ar)
            
            //vista_camara.scene.anchors.append(imagen_ar)
            
            //return vista_camara
            
        }
    }
}
