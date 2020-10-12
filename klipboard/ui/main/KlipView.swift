//
//  KlipView.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import SwiftUI

struct KlipView: View {
    @EnvironmentObject private var store: Store<KlipState, KlipAction>
    @State private var count = 0 // TODO - need to remove count after
    
    private let textDocumentProxy: UITextDocumentProxy
    
    init(_ textDocumentProxy: UITextDocumentProxy) {
        self.textDocumentProxy = textDocumentProxy
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Text("Klip").font(.title2).fontWeight(.semibold)
                Spacer()
                Button(action: {
                    self.store.send(.add("Klip\(count)"))
                    count += 1
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
            Klips(items: store.state.klips, onTap: { item in textDocumentProxy.insertText(item) })
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
        ).background(Color.white)
    }
}

struct Klips: View {
    private let items: [String]
    private let onTap: (String) -> Void
    
    public init(items: [String], onTap: @escaping (String) -> Void) {
        self.items = items
        self.onTap = onTap
    }
    
    var body: some View {
        List(items, id: \.self) { item in
            Button(action: { onTap(item) }) {
                Text(item)
            }
        }
    }
}
