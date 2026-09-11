//
//  ControladorGeneral.swift
//  Ejercicio02-maquina_estados
//
//  Created by alumno on 9/7/26.
//

import Foundation

@Observable /// Es un objeto OBSERVABLE, es decir, los otros archivos lo podran observar
class ControladorGeneral {
    var tamagotchi: Tamagotchi
    
    var estado: EstadosTamagotchi = .Neutro
    
    init(tamagotchi_cargar: Tamagotchi? = nil) {
        if let tamagotchi_cargar = tamagotchi_cargar {
            self.tamagotchi = tamagotchi_cargar
        }
        else {
            self.tamagotchi = Tamagotchi(
                nombre: "Jacinto", esta_vivo: true,
                edad: 0, hambre: 50,
                cansancio: 50, limpio: 50,
                aburrido: 50)
        }
    }
    
    func cambiar_nombre(_ nombre_nuevo: String) -> Bool {
        if tamagotchi.esta_vivo {
            tamagotchi.nombre = nombre_nuevo
            return true
        }
        return tamagotchi.esta_vivo
    }
    
    func vivo() -> Bool {
        if tamagotchi.esta_vivo == false{
            tamagotchi.esta_vivo = true
        }
        return tamagotchi.esta_vivo
    }
    
    func muerto() -> Bool {
        if tamagotchi.esta_vivo == true{
            tamagotchi.esta_vivo = false
        }
        return tamagotchi.esta_vivo
    }
    
    func actualizar_medidores() -> Bool {
        tamagotchi.hambre += 1
        tamagotchi.aburrido += 1
        tamagotchi.cansancio += 1
        tamagotchi.limpio += 1
        
        actualizar_estado()
        
        return true
    }
    
    private func actualizar_estado() {
        switch(estado) {
        case .Neutro: 
            if(tamagotchi.hambre > 60) {
                estado = .Hambriento
            }
            if(tamagotchi.cansancio > 80) {
                estado = .Adormilado
            }
        case .Hambriento:
            if(tamagotchi.hambre > 80) {
                estado = .Inanicion
            }
        case .Inanicion:
            if(tamagotchi.hambre > 100) {
                estado = .Muerte
            }
        default:
            return
        }
    }
    
    func Alimentar() -> Bool {
        if tamagotchi.esta_vivo {
            tamagotchi.hambre -= 20
            return true
        }
        
        return false
    }
}

