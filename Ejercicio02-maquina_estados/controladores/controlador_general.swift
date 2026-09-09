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
    
    init(tamagotchi_cargar: Tamagotchi? = nil) {
        if let tamagotchi_cargar = tamagotchi_cargar {
            self.tamagotchi = tamagotchi_cargar
        }
        else {
            self.tamagotchi = Tamagotchi(
                nombre: "Inicial", esta_vivo: false,
                edad: 0, hambre: 100,
                cansancio: 100, limpio: 0,
                aburrido: 0)
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
    
}

