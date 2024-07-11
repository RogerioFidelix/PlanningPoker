//
//  CollectionLayout.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import Foundation

struct CollectionLayout: Equatable {
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
    let horizontalCardSpacing: CGFloat
    let verticalCardSpacing: CGFloat
    let horizontalDeckPadding: CGFloat
    let verticalDeckPadding: CGFloat
}

extension CollectionLayout {
    static let threeFive = CollectionLayout(cardWidth: 0.275,
                                              cardHeight: 0.166,
                                              horizontalCardSpacing: 0.08,
                                              verticalCardSpacing: 0.0425,
                                              horizontalDeckPadding: 0.15,
                                              verticalDeckPadding: 0.1)
}
