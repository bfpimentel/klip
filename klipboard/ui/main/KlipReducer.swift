//
//  KlipReducer.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

extension Reducer where State == KlipState, Action == KlipAction {
    static func klipReducer() -> Reducer {
        let klipsRepository: KlipsRepository = KlipsRepositoryImpl()
        let getKlips = GetKlips(klipsRepository: klipsRepository)
        let addKlip = AddKlip(klipsRepository: klipsRepository)
        
        return Reducer { state, action in
            switch action {
            case let .add(klip):
                addKlip.invoke(AddKlip.AddKlipParams(value: klip))
            }
            
            return Reducer.sync { state in
                state.klips = getKlips.invoke(NoParams())
            }
        }
    }
}
