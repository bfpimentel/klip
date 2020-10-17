//
//  DomainDI.swift
//  klipboard
//
//  Created by Bruno Pimentel on 13/10/20.
//

import Foundation

enum DomainDI {

    static var getKlips: GetKlips {
        GetKlips(klipsRepository: DataDI.klipsRepository)
    }

    static var addKlip: AddKlip {
        AddKlip(klipsRepository: DataDI.klipsRepository)
    }

    static var updateKlip: UpdateKlip {
        UpdateKlip(klipsRepository: DataDI.klipsRepository)
    }
}
