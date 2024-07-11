//
//  SelectedCardViewController.swift
//  PlanningPoker
//
//  Created by ebankit on 11/07/2024.
//

import UIKit

class SelectedCardViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
            closeButton.addTarget(self, action: #selector(self.close), for: .touchUpInside)
        }
    }
    @IBOutlet weak var cardView: CardDeckView! {
        didSet {
            cardView.setup(card: viewModel.card, initialSide: .cardBack)
        }
    }
    
    var viewModel: SelectedCardViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tappedCardView)))
        self.view.accessibilityIdentifier = "CardViewController"
    }
    
    @objc private func tappedCardView() {
        if viewModel.isCardFlipped {
            close()
        } else {
            viewModel.flipCard()
        }
    }
    
    @objc private func close() {
        viewModel.close(from: self)
    }
}

extension SelectedCardViewController: SelectedCardViewModelViewDelegate {
    func flipCard(completion: @escaping () -> Void) {
        cardView.flip(completion: completion)
    }
}
