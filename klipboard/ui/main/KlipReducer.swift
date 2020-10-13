//
//  KlipReducer.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

extension Reducer where State == KlipState, Action == KlipAction {
    static func klipReducer() -> Reducer {
        let getKlips = DomainDI.getKlips
        let addKlip = DomainDI.addKlip
//        let updateKlip = DomainDI.updateKlip
        
        var klips: [Klip] = []
        
        return Reducer { state, action in
            switch action {
            case .get:
                break
            case let .add(klip):
                addKlip.invoke(AddKlip.AddKlipParams(value: klip))
            case .update(_):
                break
            }
            
            return Reducer.sync { state in
                let newKlips = getKlips.invoke(NoParams())
                state.klips = newKlips.map { klip in klip.value }
                klips = newKlips
            }
        }
    }
}
