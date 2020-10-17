//
//  UpdateKlip.swift
//  klipboard
//
//  Created by Bruno Pimentel on 13/10/20.
//

import Foundation

final class UpdateKlip: UseCase {

    // MARK: Lifecycle

    init(klipsRepository: KlipsRepository) {
        self.klipsRepository = klipsRepository
    }

    // MARK: Internal

    struct UpdateKlipParams {
        let klip: Klip
    }


    func invoke(_ params: UpdateKlipParams) {
        klipsRepository.updateKlip(params.klip)
    }

    // MARK: Private

    private let klipsRepository: KlipsRepository
}
