//
//  tamagotchi_base.swift
//  Ejercicio02-maquina_estados
//
//  Created by alumno on 9/9/26.
//

struct Tamagotchi {
    var nombre: String
    var esta_vivo: Bool
    var edad: Int
    var hambre: Int         // 0 = No tiene hambre / 100 = Hambriento
    var cansancio: Int      // 0 = Lleno de Energia / 100 = Agotado
    var limpio: Int         // 0 = Limpio y pulcro / 100 = Sucio y huele a obo
    var aburrido: Int       // 0 = No aburrido / 100 = Aburrido
    var enojado: Int = 0
}

/// Caracteristicas de un Tamagochi
/// - Nombre
/// - Si esta Vivo
/// - Edad
/// - Hambre
/// - Cansancio
/// - Limpio
/// - Aburrido
