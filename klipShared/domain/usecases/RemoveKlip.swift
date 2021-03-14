//
//  RemoveKlip.swift
//  klipboard
//
//  Created by Bruno Pimentel on 17/10/20.
//

import Foundation

final class RemoveKlip: UseCase {

    // MARK: Lifecycle

    init(klipsRepository: KlipsRepository) {
        self.klipsRepository = klipsRepository
    }

    // MARK: Internal

    struct Params {
        let klipId: Int
    }


    func invoke(_ params: Params) {
        klipsRepository.removeKlip(withId: params.klipId)
    }

    // MARK: Private

    private let klipsRepository: KlipsRepository
}
