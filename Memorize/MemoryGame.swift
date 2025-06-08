//
//  MemoryGame.swift
//  Memorize
//
//  Created by Rida Mansour on 7/13/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var flipsCount: Int = 0
    
    private var indexOfTheOneAndOnlyFaceUp: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMached{
            if let potentialMachIndex = indexOfTheOneAndOnlyFaceUp {
                if cards[chosenIndex].content == cards[potentialMachIndex].content {
                    cards[chosenIndex].isMached = true
                    cards[potentialMachIndex].isMached = true
                }
                indexOfTheOneAndOnlyFaceUp = nil
            } else {
                
                for index in cards.indices {
                    if cards[index].isMached == false {
                        cards[index].isFaceUp = false
                    }
                }
                indexOfTheOneAndOnlyFaceUp = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
    }
    
    mutating func peeko()  {
        self.flipsCount+=1
        for ind in 0...cards.count {
            cards[ind].isFaceUp = true
        }
        for ind in 0...cards.count {
            cards[ind].isFaceUp = false
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            cards.shuffle() 
        }
    }
    func getFlipsCount() -> Int {
        return flipsCount
    }
    
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMached: Bool = false
        var content: CardContent
        var id: Int
    }
}
