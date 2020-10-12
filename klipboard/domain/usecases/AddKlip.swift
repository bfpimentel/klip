//
//  AddKlip.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

final class AddKlip: UseCase {
    typealias Params = AddKlipParams
    typealias Result = Void
    
    private let klipsRepository: KlipsRepository
    
    init(klipsRepository: KlipsRepository) {
        self.klipsRepository = klipsRepository
    }
    
    func invoke(_ params: AddKlipParams) -> Void {
        klipsRepository.saveKlip(params.value)
    }
    
    struct AddKlipParams {
        let value: String
    }
}
