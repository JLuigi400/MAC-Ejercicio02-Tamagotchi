//
//  pantalla_usuario.swift
//  Ejercicio02-maquina_estados
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

struct PantallaInicial: View {
    //@State var controlador_tamagotchi: ControladorGeneral = ControladorGeneral()
    @Environment(ControladorGeneral.self) var controlador_tamagotchi: ControladorGeneral
    @State var nombre_nuevo = ""
    
    var body: some View {
        
        // Aqui ira la Cabecera de la Escena
        VStack {
            HStack {
                Rectangle()
                    .foregroundStyle(Color("PETAzul"))
                    .frame(width: 15, height: 15)
                
                Text("PET SYSTEM")
                    .foregroundStyle(Color("PETTexto"))
                
                Spacer()
                
                Text("ONLINE")
                    .foregroundStyle(Color("PETAzul"))
                
                Rectangle()
                    .foregroundStyle(Color("PETAzul"))
                    .frame(width: 15, height: 15)
            }
            
            Rectangle()
                .foregroundStyle(Color("PETAzul"))
                .frame(height: 4)
            
            Spacer()
            
            // Pantalla de la Mascota
            VStack {
                Spacer()
                MascotaEstado()
                    .frame(width: 220, height: 180)
                Spacer()
            }
            .frame(width: 280, height: 230)
            .background(Color("PETPanelClaro"))
            
            Spacer()
            
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
            
            // Información Principal
            HStack {
                VStack {
                    Text("PET")
                        .foregroundStyle(Color("PETAzul"))
                    Text(controlador_tamagotchi.tamagotchi.nombre)
                        .foregroundStyle(Color("PETTexto"))
                }
                
                Spacer()
                
                VStack {
                    Text("STATUS")
                        .foregroundStyle(Color("PETAzul"))
                    
                    Text("\(controlador_tamagotchi.estado)")
                        .foregroundStyle(Color("PETTexto"))
                }
            }
            
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
            
            Spacer()
            
            // Estadísticas
            HStack {
                VStack {
                    Text("HAMBRE")
                        .foregroundStyle(Color("PETAzul"))
                    Text("\(controlador_tamagotchi.tamagotchi.hambre)")
                        .foregroundStyle(Color("PETTexto"))
                }
                .frame(width: 130, height: 60)
                .background(Color("PETPanelClaro"))
                
                Spacer()
                
                VStack {
                    Text("ENERGIA")
                        .foregroundStyle(Color("PETAzul"))
                    Text("\(controlador_tamagotchi.tamagotchi.cansancio)")
                        .foregroundStyle(Color("PETTexto"))
                }
                .frame(width: 130, height: 60)
                .background(Color("PETPanelClaro"))
            }
            
            HStack {
                VStack {
                    Text("LIMPIEZA")
                        .foregroundStyle(Color("PETAzul"))
                    Text("\(controlador_tamagotchi.tamagotchi.limpio)")
                        .foregroundStyle(Color("PETTexto"))
                }
                .frame(width: 130, height: 60)
                .background(Color("PETPanelClaro"))
                
                Spacer()
                
                VStack {
                    Text("ANIMO")
                        .foregroundStyle(Color("PETAzul"))
                    Text("\(controlador_tamagotchi.tamagotchi.aburrido)")
                        .foregroundStyle(Color("PETTexto"))
                }
                .frame(width: 130, height: 60)
                .background(Color("PETPanelClaro"))
            }
            
            Spacer()
            
            // Controladores
            if controlador_tamagotchi.tamagotchi.esta_vivo {
                HStack {
                    Button("ALIMENTAR") {
                        controlador_tamagotchi.Alimentar()
                    }
                    Spacer()
                    Button("ACTUALIZAR") {
                        controlador_tamagotchi.actualizar_medidores()
                    }
                    Spacer()
                    Button("DARLE ZAPE") {
                        let comando = ComandosTamagotchi.darle_zape
                        
                        controlador_tamagotchi.procesar_comando(comando)
                    }
                }
                
                TextField("Nombre del PET: ", text: $nombre_nuevo)
                
                Button("CAMBIAR NOMBRE") {
                    controlador_tamagotchi.cambiar_nombre(nombre_nuevo)
                }
                Button("¿DARLE CON LA PALA?") {
                    controlador_tamagotchi.muerto()
                }
            }
            else {
                Text("PET OFFLINE")
                    .foregroundStyle(Color("PETRojo"))
                
                Button("REINICIAR") {
                    controlador_tamagotchi.vivo()
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color("PETFondo"))
        
        
        /*
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
        Text("Estado: \(controlador_tamagotchi.estado)")
        
        MascotaEstado()
        
        if(controlador_tamagotchi.tamagotchi.esta_vivo == true) {
            TextField("Placeholder: Nombre nuevo de tu tamagotchi", text: $nombre_nuevo)
            HStack {
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
            HStack {
                Spacer()
                Button("Actualizar Estado") {
                    controlador_tamagotchi.actualizar_medidores()
                }
                Spacer()
                Button("Alimentar") {
                    controlador_tamagotchi.Alimentar()
                }
                Spacer()
            }
            
            
        } else {
            Text("Vaya, esta muerto. Bueno... ¿Quieres revivirlo?")
            Button ("¿Revivir?") {
                controlador_tamagotchi.vivo()
            }
        }
        */
    }
}

#Preview {
    PantallaInicial()
        .environment(ControladorGeneral())
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
