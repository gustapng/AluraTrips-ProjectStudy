//
//  TipoDeViagens.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 07/02/21.
//

import Foundation

struct TripType: Codable {
    
    var destaques: [Trip]?
    var ofertas: [Trip]?
    var internacionais: [Trip]?
    
    static func jsonToData(_ json:[String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }

    static func decodeJson(_ jsonData: Data) -> TripType? {
        do {
            return try JSONDecoder().decode(TripType.self, from: jsonData)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
