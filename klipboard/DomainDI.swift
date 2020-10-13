//
//  DomainDI.swift
//  klipboard
//
//  Created by Bruno Pimentel on 13/10/20.
//

import Foundation

final class DomainDI {
    
    static var getKlips: GetKlips {
        return GetKlips(klipsRepository: DataDI.klipsRepository)
    }
    
    static var addKlip: AddKlip {
        return AddKlip(klipsRepository: DataDI.klipsRepository)
    }
    
    static var updateKlip: UpdateKlip {
        return UpdateKlip(klipsRepository: DataDI.klipsRepository)
    }
    
    private init() {
    }
}


