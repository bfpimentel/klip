//
//  KlipView.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import SwiftUI

struct KlipView: View {
    @State private var items: [String] = []
    @State private var count = 0
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Text("Klip").font(.title2).fontWeight(.semibold)
                Spacer()
                Button(action: {
                    items.append("Teste\(count)")
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
            Klips(items)
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
        ).background(Color.white)
    }
}

struct Klips: View {
    private var items: [String] = []
    
    public init(_ items: [String]) {
        self.items = items
    }
    
    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}

struct KlipView_Previews: PreviewProvider {
    static var previews: some View {
        KlipView()
    }
}
