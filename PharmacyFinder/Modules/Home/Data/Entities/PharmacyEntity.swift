//
//  PharmacyEntity.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct PharmacyResponse: Codable {
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let records: [Record]

    enum CodingKeys: String, CodingKey {
        case records
    }
}

// MARK: - Record
struct Record: Codable {
    let localidadNombre, localTelefono, comunaNombre, fecha: String
    let fkComuna, localNombre, funcionamientoDia, localID: String
    let localLng, localLat, funcionamientoHoraApertura, fkLocalidad: String
    let fkRegion: String
    let id: Int
    let localDireccion, funcionamientoHoraCierre: String

    enum CodingKeys: String, CodingKey {
        case localidadNombre = "localidad_nombre"
        case localTelefono = "local_telefono"
        case comunaNombre = "comuna_nombre"
        case fecha
        case fkComuna = "fk_comuna"
        case localNombre = "local_nombre"
        case funcionamientoDia = "funcionamiento_dia"
        case localID = "local_id"
        case localLng = "local_lng"
        case localLat = "local_lat"
        case funcionamientoHoraApertura = "funcionamiento_hora_apertura"
        case fkLocalidad = "fk_localidad"
        case fkRegion = "fk_region"
        case id = "_id"
        case localDireccion = "local_direccion"
        case funcionamientoHoraCierre = "funcionamiento_hora_cierre"
    }
}
