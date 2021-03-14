//
//  Store.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Combine
import Foundation

final class Store<State, Action>: ObservableObject {

    // MARK: Lifecycle

    init(initialState: State, reducer: Reducer<State, Action>) {
        state = initialState
        self.reducer = reducer
    }

    // MARK: Internal

    @Published private(set) var state: State


    func send(_ action: Action) {
        reducer.reduce(state, action)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: perform)
            .store(in: &cancellables)
    }

    // MARK: Private

    private let reducer: Reducer<State, Action>
    private var cancellables: Set<AnyCancellable> = []


    private func perform(change: Reducer<State, Action>.Change) {
        change(&state)
    }
}
