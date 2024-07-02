//
//  TripEmphasisViewModel.swift
//  AluraTrips
//
//  Created by Gustavo Ferreira dos Santos on 02/07/24.
//

import Foundation

class TripEmphasisViewModel: TripViewModel {
    
    var tituloSessao: String {
        return "Destaques"
    }
    
    var tipo: TripViewModelType {
        return .destaques
    }
    
    var viagens: [Trip]
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    
    init(_ viagens: [Trip]) {
        self.viagens = viagens
    }
    
}
