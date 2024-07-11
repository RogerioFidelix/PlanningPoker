//
//  CardFrontView.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import UIKit

class CardFrontView: UIView, XibLoadable {
    @IBOutlet weak var fibonacciLabel: UILabel!
    
    init(text: String, frame: CGRect) {
        super.init(frame: frame)
        self.loadNibContent()
        setupBorder()
        setupLabel(with: text)
        self.accessibilityIdentifier = "CardFrontView-\(text)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(with text: String) {
        self.fibonacciLabel.text = text
        self.fibonacciLabel.font = .systemFont(ofSize: 500)
        self.fibonacciLabel.numberOfLines = 0
        self.fibonacciLabel.adjustsFontSizeToFitWidth = true
    }
}

extension CardFrontView: CardBorder {}
