//
//  controlador_comandos.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 18/09/26.
//

enum ComandosTamagotchi: Comando {
    case darle_dulce
    case darle_zape
    case darle_brocoli
    
    case jugar
    case dormir
    case limpiar
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
            
        case .jugar:
            Entretener()
            break;
        case .dormir:
            Descansar()
            break;
        case .limpiar:
            Limpiar()
            break;
        default:
            break;
        }
        
        actualizar_medidores()
        
        return true
    }
    
}
