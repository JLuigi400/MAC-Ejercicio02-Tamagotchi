//
//  generico.swift
//  Ejercicio02-maquina_estados
//
//  Created by Iris Gabriela Perales Ortiz on 18/09/26.
//
protocol Comandos { }

enum ComandosUI: Comandos {
    case Abrir
    case Cerrar
}

enum ComandosBarra: Comandos {
    case Otra_Cosa
    case Mas_Cosas
}

/*
enum ComandosTamagotchi: Comando {
    case Matar
    case Alimentar(cantidad: Int)
    case Divertir(cantidad: Int)
}

let comando: ComandosTamagotchi.Alimentar(cantidad: 100)
*/
