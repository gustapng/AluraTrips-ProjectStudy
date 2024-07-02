//
//  TripViewModel.swift
//  AluraTrips
//
//  Created by Gustavo Ferreira dos Santos on 02/07/24.
//

import Foundation

enum TripViewModelType: String {
    case destaques
    case ofertas
    case internacionais
}

protocol TripViewModel {
    var tituloSessao: String { get }
    var tipo: TripViewModelType { get }
    var viagens: [Trip] { get set }
    var numeroDeLinhas: Int { get }
}
