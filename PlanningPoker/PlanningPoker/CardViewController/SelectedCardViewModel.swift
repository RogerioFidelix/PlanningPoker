//
//  SelectedCardViewModel.swift
//  PlanningPoker
//
//  Created by ebankit on 11/07/2024.
//

import Foundation
import UIKit

protocol SelectedCardViewModelViewDelegate: AnyObject {
    func flipCard(completion: @escaping () -> Void)
}

protocol SelectedCardViewModelDelegate: AnyObject {
    func tapClose(from viewController: SelectedCardViewController)
}

class SelectedCardViewModel {

    private(set) var isCardFlipped = false
    
    let card: CardData
    weak var delegate: SelectedCardViewModelDelegate?
    weak var viewDelegate: SelectedCardViewModelViewDelegate?
    
    init(card: CardData) {
        self.card = card
    }
    
    func flipCard() {
        viewDelegate?.flipCard { [weak self] in
            self?.isCardFlipped = true
        }
    }
    
    func close(from viewController: SelectedCardViewController) {
        delegate?.tapClose(from: viewController)
    }
}
