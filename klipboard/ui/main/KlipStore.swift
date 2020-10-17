//
//  KlipStore.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

extension Store where State == KlipState, Action == KlipAction {
    static func klipStore() -> Store<KlipState, KlipAction> {
        Store(initialState: KlipState(), reducer: Reducer.klipReducer())
    }
}
