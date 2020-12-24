//
//  ErrorType.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation


enum ErrorType: Error, LocalizedError {
    case parseUrlFail
    case serverError
    case noConnectivity
    case invalidJSON
    case unknown
    case defaultError(Error)
    
    var errorDescription: String? {
        switch self {
        case .parseUrlFail:
            return "Não é possível inicializar a URL."
        case .serverError:
            return "Houve um erro ao se comunicar com o servidor.\nTente novamente."
        case .noConnectivity:
            return "Verifique sua conexão com a internet."
        case .invalidJSON:
            return "JSON inválido"
        case .unknown:
            return "Erro desconhecido"
        case .defaultError(let error):
            return error.localizedDescription
        }
    }
}
