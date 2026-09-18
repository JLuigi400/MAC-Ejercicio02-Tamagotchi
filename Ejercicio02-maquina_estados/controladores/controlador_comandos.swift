//
//  controlador_comandos.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 18/09/26.
//

import ARKit

enum ComandosTamagotchi: Comando {
    case darle_dulce
    case darle_zape
    case darle_brocoli
}

extension ControladorGeneral: ProcesarComandos {
    func procesar_comando(_ comando: Comando) -> Bool {
        
        if(!(comando is ComandosTamagotchi)) {
            return false
        }
        
        switch(comando as! ComandosTamagotchi) {
            
        case .darle_dulce:
            Entretener()
            Alimentar()
            break;
        case .darle_zape:
            Adormilar()
            Enojar()
            break;
        case .darle_brocoli:
            Alimentar()
            Enojar()
            break;
        default:
            break;
        }
        
        return true
    }
    
}
