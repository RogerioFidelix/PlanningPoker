//
//  CardDeck.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import Foundation

struct CardDeck: Equatable {
    let id: String
    let name: String
    let cards: [CardData]
    let layout: CollectionLayout
}

extension CardDeck {
    static var fibonacci: CardDeck {
        let cards = [0, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
            .map(String.init)
            .map(CardData.init) + extraCards
        return CardDeck(id: "fibonacci", name: "fibonacci", cards: cards, layout: .threeFive)
    }
    
    private static var extraCards: [CardData] {
        let values = ["?","∞","☕️"]
        return values.map(CardData.init)
    }
}
