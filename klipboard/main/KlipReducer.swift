//
//  KlipReducer.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

extension Reducer where State == KlipState, Action == KlipAction {
    static func klipReducer() -> Reducer {
        var klips: [String] = [] // TODO - need to move to data source
        
        return Reducer { state, action in
            switch action {
            case let .add(klip):
                klips.append(klip)
            }
            
            return Reducer.sync { state in
                state.klips = klips
            }
        }
    }
}

