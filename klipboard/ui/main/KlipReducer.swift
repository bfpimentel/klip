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
        let removeKlip = DomainDI.removeKlip
//        let updateKlip = DomainDI.updateKlip

        return Reducer { state, action in
            switch action {
            case .get: ()
            case let .add(klip): addKlip.invoke(AddKlip.Params(value: klip))
            case let .remove(id): removeKlip.invoke(RemoveKlip.Params(klipId: id))
            case .update: ()
            }

            return Reducer.sync { state in
                state.klips = getKlips.invoke(NoParams()).map {
                    KlipViewData(id: $0.id, value: $0.value)
                }
            }
        }
    }
}
