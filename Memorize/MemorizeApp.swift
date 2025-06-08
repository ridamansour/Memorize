//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rida Mansour on 7/12/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = emojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
