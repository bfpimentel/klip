//
//  GetKlips.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

final class GetKlips: UseCase {
    typealias Params = NoParams
    typealias Result = [String]
    
    private let klipsRepository: KlipsRepository
    
    init(klipsRepository: KlipsRepository) {
        self.klipsRepository = klipsRepository
    }
    
    func invoke(_ params: NoParams) -> [String] {
        return klipsRepository.getKlips()
    }
}
