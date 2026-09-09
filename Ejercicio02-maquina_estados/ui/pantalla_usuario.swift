//
//  pantalla_usuario.swift
//  Ejercicio02-maquina_estados
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

struct PantallaInicial: View {
    @State var controlador_tamagotchi: ControladorGeneral = ControladorGeneral()
    @State var nombre_nuevo = ""
    
    var body: some View {
        Text("Su nombre es: \(controlador_tamagotchi.tamagotchi.nombre)" )
        Text("Edad: \(controlador_tamagotchi.tamagotchi.edad)")
        Text("Estado de vida: \(controlador_tamagotchi.tamagotchi.esta_vivo)")
        if(controlador_tamagotchi.tamagotchi.esta_vivo){
            Text("Esta Vivo.")
        }
        else {
            Text("Esta Muerto. Le quitaste su suscripcion de vivir.")
        }
        
        Text("Hambre: \(controlador_tamagotchi.tamagotchi.hambre)")
        Text("Cansancio: \(controlador_tamagotchi.tamagotchi.cansancio)")
        Text("Limpio: \(controlador_tamagotchi.tamagotchi.limpio)")
        Text("Aburrido: \(controlador_tamagotchi.tamagotchi.aburrido)")
        
        if(controlador_tamagotchi.tamagotchi.esta_vivo == true) {
            TextField("Placeholder: Nombre nuevo de tu tamagotchi", text: $nombre_nuevo)
            HStack{
                Spacer()
                Button("Cambiar Nombre") {
                    //controlador_tamagotchi.tamagotchi.esta_vivo = true
                    if (controlador_tamagotchi.tamagotchi.esta_vivo == true) {
                        controlador_tamagotchi.cambiar_nombre(nombre_nuevo)
                    }
                }
                Spacer()
                Button("¿Darle con la pala?") {
                    controlador_tamagotchi.muerto()
                }
                Spacer()
            }
            
            
        } else {
            Text("Vaya, esta muerto. Bueno... ¿Quieres revivirlo?")
            Button ("¿Revivir?") {
                controlador_tamagotchi.vivo()
            }
        }
        
    }
}

#Preview {
    PantallaInicial()
}

/*
 if(controlador_tamagotchi.tamagotchi.esta_vivo == true){
     Text("Viva, este tamagotchi esta Vivo. Ahora nombralo antes de que muera.")
     TextField("Placeholder: Nombre nuevo de tu tamagotchi", text: $nombre_nuevo)
     Button("Cambiar Nombre"){
         //mcontrolador_tamagotchi.tamagotchi.esta_vivo = true
         if (controlador_tamagotchi.tamagotchi.esta_vivo == true){
             controlador_tamagotchi.cambiar_nombre(nombre_nuevo)
         }
     }
 } else {
     Text("Vaya, esta muerto. Bueno... ¿Quieres revivirlo?")
 }
 
 Button("¿Vivo o muerto?"){
     if (controlador_tamagotchi.tamagotchi.esta_vivo == false){
         controlador_tamagotchi.tamagotchi.esta_vivo = true
     }
     else {
         controlador_tamagotchi.tamagotchi.esta_vivo = false
     }
 }
 */
