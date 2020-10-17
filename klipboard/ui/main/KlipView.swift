//
//  KlipView.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import SwiftUI

struct KlipView: View {
    
    // MARK: Lifecycle
    
    init(_ textDocumentProxy: UITextDocumentProxy) {
        self.textDocumentProxy = textDocumentProxy
    }
    
    // MARK: Internal
    
    var body: some View {
        store.send(.get)
        
        return VStack {
            HStack(alignment: .top, spacing: 0) {
                Text("Klip").font(.title2).fontWeight(.semibold)
                Spacer()
                Button(action: {
                    if let text = textDocumentProxy.selectedText {
                        store.send(.add(text))
                    }
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(6)
                        .frame(width: 24, height: 24)
                        .background(Color.white)
                        .overlay(Circle().stroke(Color.blue, lineWidth: 1))
                        .foregroundColor(.blue)
                }
            }.frame(maxWidth: .infinity).padding()
            
            KlipList(
                items: store.state.klips,
                onTap: textDocumentProxy.insertText,
                onDelete: { store.send(.remove(id: $0)) }
            )
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        ).background(Color.white)
    }
    
    // MARK: Private
    
    @EnvironmentObject private var store: Store<KlipState, KlipAction>
    
    private let textDocumentProxy: UITextDocumentProxy
}

struct KlipList: View {
    private let items: [KlipViewData]
    private let onTap: (String) -> Void
    private let onDelete: (Int) -> Void
    
    public init(
        items: [KlipViewData],
        onTap: @escaping (String) -> Void,
        onDelete: @escaping (Int) -> Void
    ) {
        self.items = items
        self.onTap = onTap
        self.onDelete = onDelete
    }
    
    var body: some View {
        List {
            ForEach(items, id: \.id) { klip in
                Button(action: { onTap(klip.value) }) {
                    Text(klip.value)
                }
            }
            .onDelete(perform: { indexSet in onDelete(items[indexSet.first!].id) })
        }
    }
}

struct KlipViewData {
    let id: Int
    let value: String
}

