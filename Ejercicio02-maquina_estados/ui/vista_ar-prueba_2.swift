//
//  vista_ar-prueba_2.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 30/09/26.
//

import SwiftUI
import RealityKit

struct PruebaVistaAR: View {
    @State var mensajes: [String] = ["HOAL MUNDO"]
    
    var body: some View {
        RealityView{ escenario in
            let entidad_raiz = Entity()
            
            escenario.camera = .spatialTracking
            
            let img_1 = AnchorEntity(.image(group: "archivos_ar", name: "img_1"))
            let img_2 = AnchorEntity(.image(group: "archivos_ar", name: "img_2"))
            img_1.name = "img1"
            img_2.name = "img2"
            
            img_1.anchoring.physicsSimulation = .none
            img_2.anchoring.physicsSimulation = .none
            
            let cajita_1 = ModelEntity(mesh: .generateBox(size: 0.1))
            cajita_1.model?.materials = [SimpleMaterial(color: .red, isMetallic: true)]
            cajita_1.components.set(
                CollisionComponent(
                    shapes: [ShapeResource.generateBox(size: SIMD3<Float>(0.1, 0.1, 0.1))],
                    mode: .trigger
                )
            )
            
            cajita_1.components.set(InputTargetComponent())
            cajita_1.anchor?.anchoring.physicsSimulation = .none
            
            
            cajita_1.name = "caja_1"
            
            let cajita_2 = cajita_1.clone(recursive: true)
            
            cajita_2.name = "caja_2"
            
            img_1.addChild(cajita_1)
            img_2.addChild(cajita_2)
            // cajita_1.setParent(img_1)
            // cajita_2.setParent(img_2)
            
            img_1.components.set(
                CollisionComponent(
                    shapes: [ShapeResource.generateBox(size: SIMD3<Float>(0.1, 0.1, 0.1))],
                    mode: .trigger
                )
            )
            img_2.components.set(
                CollisionComponent(
                    shapes: [ShapeResource.generateBox(size: SIMD3<Float>(0.1, 0.1, 0.1))],
                    mode: .trigger
                )
            )

            
            entidad_raiz.addChild(img_1)
            entidad_raiz.addChild(img_2)
            
            escenario.add(entidad_raiz)
            
            escenario.subscribe(to: CollisionEvents.Began.self, { evento in
                mensajes.append("Un evento con info \(evento.entityA.name) -> \(evento.entityB.name)")
            })
            
            escenario.subscribe(to: SceneEvents.AnchoredStateChanged.self, { evento in
                mensajes.append("Ancla: \(evento.anchor.name) posicion: \(evento.anchor.position(relativeTo: entidad_raiz)) visible: \(evento.isAnchored)")
            })
            
            escenario.subscribe(to: SceneEvents.Update.self){ _ in
                let pos_a = img_1.position(relativeTo: nil)
                let pos_b = img_2.position(relativeTo: nil)
                
                let distancia = simd_distance(pos_a, pos_b)
                
                if distancia > 1.0{
                    mensajes.append("Distancia: \(distancia)")
                }
            }
            
            
        }
        .gesture(
            TapGesture()
                .targetedToAnyEntity()
                .onEnded { evento in
                    mensajes.append("Un pulsaset a \(evento.entity.name)")
                }
        )
        ScrollView{
            ForEach(mensajes, id: \.self){ mensaje in
                Text(mensaje)
            }
        }.frame(height: 200)
    }
}

#Preview {
    PruebaVistaAR()
}
