//
//  CardView.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import UIKit

extension CardDeckView {
    enum CardSide {
        case cardFront
        case cardBack
    }
}

class CardDeckView: UIView {
    
    private var cardBorders: (front: CardBorder, back: CardBorder)!
    
    func setup(card: CardData, initialSide: CardSide) {
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        cardBorders = (front: CardFrontView(text: card.text, frame: frame),
                       back: CardBackView(frame: frame))
        switch initialSide {
        case .cardFront:
            useDesign(cardBorders.front)
        case .cardBack:
            useDesign(cardBorders.back)
        }
    }
    
    func flip(completion: @escaping () -> Void) {
        guard cardBorders != nil else {
            fatalError("CardDeckView setup failed before calling flip()")
        }
        if cardBorders.back.superview == nil {
            cardBorders = (front: cardBorders.back, back: cardBorders.front)
        } else {
            cardBorders = (front: cardBorders.front, back: cardBorders.back)
        }
        UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.cardBorders.back.removeFromSuperview()
            self.useDesign(self.cardBorders.front)
        }, completion: { _ in completion() } )
    }
    
    private func useDesign(_ design: CardBorder) {
        design.frame = self.bounds
        design.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(design)
    }
}
