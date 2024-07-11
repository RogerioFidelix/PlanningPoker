//
//  CardCollectionCell.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import UIKit

class CardCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var cardView: CardDeckView!
    
    var card: CardData! {
        didSet {
            cardView.setup(card: card, initialSide: .cardFront)
        }
    }
}
