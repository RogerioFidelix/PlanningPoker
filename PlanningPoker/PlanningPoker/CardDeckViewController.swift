//
//  CardDeckViewController.swift
//  PlanningPoker
//
//  Created by ebankit on 10/07/2024.
//

import UIKit

class CardDeckViewController: UIViewController {
    @IBOutlet weak var holderView: UIView!
    
    var viewModel: CardDeckViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(UINib(nibName: "CardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CardDeckViewModel(deck: .fibonacci)
        updateTitle()
        setupCollectionView()
        collectionView.reloadData()
        self.view.accessibilityIdentifier = "CardDeckViewController"
    }
    
    private func updateTitle() {
        self.title = "CardDeckViewController"
    }
    
    private func setupCollectionView() {
        holderView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layoutCollectionView()
    }
    
    private func layoutCollectionView() {
        holderView.removeConstraints(holderView.constraints)
        holderView.addConstraints(getConstraintsForCollectionView())
        holderView.layoutIfNeeded()
    }
    
    private func getConstraintsForCollectionView() -> [NSLayoutConstraint] {
        let horizontalC = NSLayoutConstraint(item: collectionView,
                                             attribute: .centerX,
                                             relatedBy: .equal,
                                             toItem: holderView,
                                             attribute: .centerX,
                                             multiplier: 1,
                                             constant: 0)
        let verticalC = NSLayoutConstraint(item: collectionView,
                                           attribute: .centerY,
                                           relatedBy: .equal,
                                           toItem: holderView,
                                           attribute: .centerY,
                                           multiplier: 1,
                                           constant: 0)
        let widthC = NSLayoutConstraint(item: collectionView,
                                        attribute: .width,
                                        relatedBy: .equal,
                                        toItem: holderView,
                                        attribute: .width,
                                        multiplier: viewModel.deckWidthMultiplier,
                                        constant: 0)
        let heightC = NSLayoutConstraint(item: collectionView,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: holderView,
                                         attribute: .height,
                                         multiplier: viewModel.deckHeightMultiplier,
                                         constant: 0)
        return [horizontalC, verticalC, widthC, heightC]
    }
}

extension CardDeckViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.deckSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionCell", for: indexPath) as! CardCollectionCell
        cell.card = viewModel.card(at: indexPath.row)
        return cell
    }
}

extension CardDeckViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.cardSize(for: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.horizontalCardSpacing(for: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return viewModel.verticalCardSpacing(for: collectionView)
    }
}

extension CardDeckViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = viewModel.card(at: indexPath.row)
        viewModel.showCard(card, from: self)
    }
}

extension CardDeckViewController: CardDeckViewModelViewDelegate {
    func didUpdateDeck() {
        updateTitle()
        layoutCollectionView()
        collectionView.reloadData()
    }
    
    func tapShowCard(_ card: CardData, from viewController: CardDeckViewController) {
        showCard(card, from: viewController)
    }
    
    private func showCard(_ card: CardData, from viewController: UIViewController) {
        let vc = SelectedCardViewController()
        let vm = SelectedCardViewModel(card: card)
        vc.viewModel = vm
        vm.delegate = self
        viewController.present(vc, animated: true)
    }
}

extension CardDeckViewController: SelectedCardViewModelDelegate {
    func tapClose(from viewController: SelectedCardViewController) {
        viewController.dismiss(animated: true)
    }
}
