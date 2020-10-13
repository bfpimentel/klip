//
//  Reducer.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation
import Combine

struct Reducer<State, Action> {
    typealias Change = (inout State) -> Void
    let reduce: (State, Action) -> AnyPublisher<Change, Never>
}

extension Reducer {
    static func sync(_ fun: @escaping (inout State) -> Void) -> AnyPublisher<Change, Never> {
        Just(fun).eraseToAnyPublisher()
    }
}

