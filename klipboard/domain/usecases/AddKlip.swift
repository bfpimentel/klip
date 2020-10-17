//
//  AddKlip.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

final class AddKlip: UseCase {

    // MARK: Lifecycle

    init(klipsRepository: KlipsRepository) {
        self.klipsRepository = klipsRepository
    }

    // MARK: Internal

    struct AddKlipParams {
        let value: String
    }


    func invoke(_ params: AddKlipParams) {
        klipsRepository.addKlip(params.value)
    }

    // MARK: Private

    private let klipsRepository: KlipsRepository
}
