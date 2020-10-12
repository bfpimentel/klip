//
//  KlipsRepositoryImpl.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

final class KlipsRepositoryImpl: KlipsRepository {
    
    private var klips: [String] = []
    
    func getKlips() -> [String] {
        return self.klips
    }
    
    func saveKlip(_ klip: String) {
        self.klips.append(klip)
    }
}
