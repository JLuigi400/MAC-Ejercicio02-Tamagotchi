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
            
            SeparadorPET()
            
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
            
            SeparadorPET()
            
            Spacer()
            
            // Estadísticas
            HStack {
                Spacer()
                
                TarjetaEstado(
                    titulo: "HAMBRE", valor: controlador_tamagotchi.tamagotchi.hambre
                )
                
                Spacer()
                
                TarjetaEstado(
                    titulo: "ENERGIA", valor: controlador_tamagotchi.tamagotchi.cansancio
                )
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                TarjetaEstado(
                    titulo: "LIMPIEZA", valor: controlador_tamagotchi.tamagotchi.limpio
                )
                
                Spacer()
                
                TarjetaEstado(
                    titulo: "ANIMO", valor: controlador_tamagotchi.tamagotchi.aburrido
                )
                
                Spacer()
            }
            
            Spacer()
            
            // Controladores
            if controlador_tamagotchi.tamagotchi.esta_vivo {
                VStack {
                    Text ("ACCIONES")
                        .foregroundStyle(Color("PETAzul"))
                    HStack {
                        Spacer()
                        Button("ALIMENTAR") {
                            controlador_tamagotchi.Alimentar()
                        }
                        Spacer()
                        Button("DARLE ZAPE") {
                            let comando = ComandosTamagotchi.darle_zape
                            
                            controlador_tamagotchi.procesar_comando(comando)
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button("LIMPIAR") {
                            controlador_tamagotchi.Limpiar()
                        }
                        Spacer()
                        Button("DESCANSAR") {
                            let comando = ComandosTamagotchi.dormir
                            
                            controlador_tamagotchi.procesar_comando(comando)
                        }
                        Spacer()
                    }
                    /*
                    Button("ACTUALIZAR") {
                        controlador_tamagotchi.actualizar_medidores()
                    }
                    */
                }
                
                SeparadorPET()
                
                VStack {
                    Text ("IDENTIDAD")
                        .foregroundStyle(Color("PETAzul"))
                    
                    HStack {
                        Text("Nombre del PET: ")
                            .foregroundStyle(Color("PETAmarillo"))
                        TextField("Nombre", text: $nombre_nuevo)
                    }
                    
                    Button("CAMBIAR NOMBRE") {
                        controlador_tamagotchi.cambiar_nombre(nombre_nuevo)
                    }
                }
                
                SeparadorPET()
                
                Button("¿DARLE CON LA PALA?") {
                    controlador_tamagotchi.muerto()
                }
                .foregroundStyle(Color("PETRojo"))
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
    }
}

#Preview {
    PantallaInicial()
        .environment(ControladorGeneral())
}
