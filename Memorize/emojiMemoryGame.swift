//
//  emojiMemoryGame.swift
//  Memorize
//
//  Created by Rida Mansour on 7/13/22.
//

import SwiftUI




class emojiMemoryGame: ObservableObject {
    
    static var emojis = ["✈️", "🚀", "🚗", "⛽️", "🚘", "🚙", "🏎", "🛵", "🚌", "🚛", "🛳", "🚑", "🛩", "🛴", "🚜"]
    

    static func createMemoryGame() -> MemoryGame<String> {
        emojis.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: 12) {
            pairIndex in emojis[pairIndex]
        }
    }
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
//    var FlipCount: Int {
//        return model.getFlipsCount()
//    }
    
    //MARK: - Intent(s)
    func FlipCount() -> Int {
        return model.getFlipsCount()
    }
    func peek() {
        model.peeko()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
        
    }
    func newColor() -> Color{
        let arr:[Color] = [.indigo, .teal, .blue, .brown, .cyan]
        return arr[Int.random(in: 0..<arr.count)]
    }
}



struct Previews_emojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        let game = emojiMemoryGame()
        ContentView(viewModel: game)
    }
}
