//
//  Reducer.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Combine
import Foundation

struct Reducer<State, Action> {
    typealias Change = (inout State) -> Void
    let reduce: (State, Action) -> AnyPublisher<Change, Never>
}

extension Reducer {
    static func sync(_ change: @escaping Change) -> AnyPublisher<Change, Never> {
        Just(change).eraseToAnyPublisher()
    }
}

