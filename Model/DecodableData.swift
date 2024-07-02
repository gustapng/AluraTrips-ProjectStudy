//
//  DecodableData.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 28/01/21.
//

import Foundation

let tripSessions: [TripViewModel]? = load("server-response.json")

func load(_ filename: String) -> [TripViewModel]? {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            fatalError("error to read json dictionary")
        }
        
        guard let listaDeViagens = json["viagens"] as? [String: Any] else {
            fatalError("error to read travel list")
        }
        
        guard let jsonData = TripType.jsonToData(listaDeViagens) else { return nil }
        
        let TripType = TripType.decodeJson(jsonData)
        
        var listaViagemViewModel: [TripViewModel] = []
        
        for sessao in listaDeViagens.keys {
            switch TripViewModelType(rawValue: sessao)  {
            case .destaques:
                if let destaques = TripType?.destaques {
                    let destaqueViewModel = TripEmphasisViewModel(destaques)
                    listaViagemViewModel.insert(destaqueViewModel, at: 0)
                }
            default:
                break
            }
        }
        
        return listaViagemViewModel
    } catch {
        fatalError("Couldn't parse")
    }
}
