//
//  klipApp.swift
//  klip
//
//  Created by Bruno Pimentel on 12/10/20.
//

import SwiftUI

@main
struct klipApp: App {
    @State private var text = ""

    var body: some Scene {
        WindowGroup {
            ContentView()
            TextField("Teste de input", text: $text)
        }
    }
}
