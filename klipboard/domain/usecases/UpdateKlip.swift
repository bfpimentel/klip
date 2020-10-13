//
//  UpdateKlip.swift
//  klipboard
//
//  Created by Bruno Pimentel on 13/10/20.
//

import Foundation

final class UpdateKlip: UseCase {
    typealias Params = UpdateKlipParams
    typealias Result = Void
    
    private let klipsRepository: KlipsRepository
    
    init(klipsRepository: KlipsRepository) {
        self.klipsRepository = klipsRepository
    }
    
    func invoke(_ params: UpdateKlipParams) -> Void {
        klipsRepository.updateKlip(<#T##klip: KlipModel##KlipModel#>)(params.value)
    }
    
    struct UpdateKlipParams {
        let id: String
        let value: String
    }
}
