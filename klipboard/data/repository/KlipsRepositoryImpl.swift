//
//  KlipsRepositoryImpl.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

final class KlipsRepositoryImpl: KlipsRepository {

    // MARK: Lifecycle

    init(klipsLocalDataSource: KlipsLocalDataSource) {
        self.klipsLocalDataSource = klipsLocalDataSource
    }

    // MARK: Internal

    func getKlips() -> [KlipModel] {
        klipsLocalDataSource.getKlips()
            .map { KlipModelImpl(id: $0.id, value: $0.value) }
    }

    func updateKlip(_ klip: Klip) {
        klipsLocalDataSource.updateKlip(klip)
    }

    func addKlip(_ klipValue: String) {
        klipsLocalDataSource.addKlip(klipValue)
    }

    // MARK: Private

    private let klipsLocalDataSource: KlipsLocalDataSource
}


