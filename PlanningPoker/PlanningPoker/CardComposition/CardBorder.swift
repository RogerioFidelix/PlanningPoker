//
//  CardBorder.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import UIKit

protocol CardBorder: UIView {
    func setupBorder()
}

extension CardBorder {
    func setupBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 5
    }
}
