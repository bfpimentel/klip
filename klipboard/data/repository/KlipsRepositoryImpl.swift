//
//  KlipsRepositoryImpl.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

final class KlipsRepositoryImpl: KlipsRepository {
    
    private let klipsLocalDataSource: KlipsLocalDataSource
    
    init(klipsLocalDataSource: KlipsLocalDataSource) {
        self.klipsLocalDataSource = klipsLocalDataSource
    }
    
    func getKlips() -> [KlipModel] {
        return self.klipsLocalDataSource.getKlips().map { klipDTO in
            KlipModelImpl(id: klipDTO.id, value: klipDTO.value)
        }
    }
    
    func updateKlip(_ klip: Klip) {
        self.klipsLocalDataSource.updateKlip(klip)
    }
    
    func addKlip(_ klipValue: String) {
        self.klipsLocalDataSource.addKlip(klipValue)
    }
}


