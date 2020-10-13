//
//  GetKlips.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

final class GetKlips: UseCase {
    typealias Params = NoParams
    typealias Result = [Klip]
    
    private let klipsRepository: KlipsRepository
    
    init(klipsRepository: KlipsRepository) {
        self.klipsRepository = klipsRepository
    }
    
    func invoke(_ params: NoParams) -> [Klip] {
        return klipsRepository.getKlips().map { klipModel in
            Klip(id: klipModel.id, value: klipModel.value)
        }
    }
}
