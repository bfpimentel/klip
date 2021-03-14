//
//  GetKlips.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

final class GetKlips: UseCase {

    // MARK: Lifecycle

    init(klipsRepository: KlipsRepository) {
        self.klipsRepository = klipsRepository
    }

    // MARK: Internal

    func invoke(_ params: NoParams) -> [Klip] {
        klipsRepository.getKlips()
            .map { Klip(id: $0.id, value: $0.value) }
    }

    // MARK: Private

    private let klipsRepository: KlipsRepository
}
