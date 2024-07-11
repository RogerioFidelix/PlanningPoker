//
//  CardBackView.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import UIKit

class CardBackView: UIView, XibLoadable {
    @IBOutlet weak var helperView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.loadNibContent()
        setupBorder()
        helperView.layer.cornerRadius = 5
        self.accessibilityIdentifier = "CardBackView"
    }
}

extension CardBackView: CardBorder {}
