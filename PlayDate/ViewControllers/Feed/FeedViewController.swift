//
//  FeedViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//

import UIKit
import Shuffle_iOS

class FeedViewController: UIViewController {
    
    let cardStack = SwipeCardStack()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        
        cardStack.dataSource = self
        cardStack.delegate = self
        view.addSubview(cardStack)
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardStack.topAnchor.constraint(equalTo: view.topAnchor),
            cardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FeedViewController: SwipeCardStackDataSource, SwipeCardStackDelegate {
    func card(fromImage image: UIImage) -> SwipeCard {
        let swipeCard = SwipeCard()
        swipeCard.largeContentImage = UIImage(named: "LogoMedium")
        return swipeCard
    }
    
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        return card(fromImage: UIImage())
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return 1
    }
}
