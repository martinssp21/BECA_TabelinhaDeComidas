//
//  ProtocoloComidas.swift
//  TabelinhaDeComidas
//
//  Created by Rodrigo Martins on 02/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import Foundation


struct ComidasDoMundo: Decodable {
    var comidasDoMundo : [AtributosDeComidas]
    
    enum CodingKeys: String, CodingKey {
        case comidasDoMundo = "comidas_do_mundo"
    }
}

extension ComidasDoMundo {
    static func parse(_ data: Data) -> ComidasDoMundo{
        
        var comidasDoMundo = ComidasDoMundo(comidasDoMundo: [AtributosDeComidas]())
        do {
           comidasDoMundo = try JSONDecoder().decode(ComidasDoMundo.self, from: data)
        } catch let error {
            print("Deu ERRO \(error)")
        }
        return comidasDoMundo
    }
}

struct AtributosDeComidas: Decodable {
    var nomeDaComida : String?
    var calorias : Int?
    var descricaoDaComida : String?
    var imagem : String?
    var restaurante : String?
    
    enum CodingKeys: String, CodingKey {
        case nomeDaComida = "nome"
        case calorias
        case descricaoDaComida = "descricao"
        case imagem
        case restaurante
    }
    
    init(from decoder : Decoder) throws {
        let valores = try decoder.container(keyedBy: CodingKeys.self)
        
        nomeDaComida = try valores.decodeIfPresent(String.self, forKey: AtributosDeComidas.CodingKeys.nomeDaComida)
        calorias = try valores.decodeIfPresent(Int.self, forKey: .calorias)
        descricaoDaComida = try valores.decodeIfPresent(String.self, forKey: .descricaoDaComida)
        imagem = try valores.decodeIfPresent(String.self, forKey: .imagem)
        restaurante = try valores.decodeIfPresent(String.self, forKey: .restaurante)
    }
}

