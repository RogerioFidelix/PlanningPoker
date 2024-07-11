//
//  DeckViewModel.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import UIKit

protocol CardDeckViewModelViewDelegate: AnyObject {
    func didUpdateDeck()
    func tapShowCard(_ card: CardData, from viewController: CardDeckViewController)
}

class CardDeckViewModel {
    private var deck: CardDeck
    
    weak var viewDelegate: CardDeckViewModelViewDelegate?
    
    init(deck: CardDeck = .fibonacci) {
        self.deck = deck
    }
    
    func updateDeck(_ deck: CardDeck) {
        self.deck = deck
        viewDelegate?.didUpdateDeck()
    }
    
    var deckSize: Int {
        return deck.cards.count
    }
    
    func card(at index: Int) -> CardData {
        return deck.cards[index]
    }
    
    var deckWidthMultiplier: CGFloat {
        return 1 - deck.layout.horizontalDeckPadding
    }
    
    var deckHeightMultiplier: CGFloat {
        return 1 - deck.layout.verticalDeckPadding
    }
    
    func cardSize(for parentView: UIView) -> CGSize {
        let w = parentView.frame.width * deck.layout.cardWidth
        let h = parentView.frame.height * deck.layout.cardHeight
        return CGSize(width: w, height: h)
    }
    
    func horizontalCardSpacing(for parentView: UIView) -> CGFloat {
        return parentView.frame.width * deck.layout.horizontalCardSpacing
    }
    
    func verticalCardSpacing(for parentView: UIView) -> CGFloat {
        return parentView.frame.height * deck.layout.verticalCardSpacing
    }
    
    func showCard(_ card: CardData, from viewController: CardDeckViewController) {
        viewDelegate?.tapShowCard(card, from: viewController)
    }
}
