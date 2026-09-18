//
//  sistema_comandos.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 18/09/26.
//

protocol Comando {
    
}

protocol ProcesarComandos {
    func procesar_comando(_ comando: Comando) -> Bool
}
