//
//  Porte.swift
//  Caoculadora
//
//  Created by Bruno Cezario on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno"
    case medio = "Médio"
    case grande = "Grande"
    
    func calcularIdade(deAnos anosCaninos: Int,
                       eMeses mesesCaninos: Int) -> Int {
        // o resultado vai ser os anos * multiplicador + a fração do ano em meses * multiplicador
        // multiplicador:
        //  * pequeno: 6
        //  * médio: 7
        //  * grande: 8
        let multiplicador: Int
        
        switch self {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        
        let result = anosCaninos * multiplicador + mesesCaninos * multiplicador / 12
        
        return result
    }
}
