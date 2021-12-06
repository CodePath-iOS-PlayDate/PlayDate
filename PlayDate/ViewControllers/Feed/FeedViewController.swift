//
//  FeedViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//

import UIKit
import Shuffle_iOS

class FeedViewController: UIViewController {
    
    private let cardStack = SwipeCardStack()
    private let petProfileCardModels = [
        PetProfile(
            name: "Sample",
            age: 1,
            type: "Dog",
            image: UIImage(named: "LogoMedium")
        ),
        PetProfile(
            name: "Sample 2",
            age: 2,
            type: "Dog",
            image: UIImage(named: "LogoMedium")
        ),
        PetProfile(
            name: "Sample 3",
            age: 3,
            type: "Dog",
            image: UIImage(named: "LogoMedium")
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.largeTitleTextAttributes = [.foregroundColor: Colors.blueGreen]
        appearance.titleTextAttributes = [.foregroundColor: Colors.blueGreen]
        appearance.shadowColor = .clear
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        cardStack.dataSource = self
        cardStack.delegate = self
        view.addSubview(cardStack)
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cardStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            cardStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FeedViewController: SwipeCardStackDataSource, SwipeCardStackDelegate {
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let swipeCard = SwipeCard()
        swipeCard.swipeDirections = [.left, .up, .right]
        // Like / Dislike overlay needs to be add here for each swipe direction

        let petModel = petProfileCardModels[index]
        swipeCard.content = CardContentView(withImage: petModel.image)
        return swipeCard
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return petProfileCardModels.count
    }
    
    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
      print("Swiped all cards!")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didUndoCardAt index: Int, from direction: SwipeDirection) {
      print("Undo \(direction) swipe on \(petProfileCardModels[index].name)")
    }

    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
      print("Swiped \(direction) on \(petProfileCardModels[index].name)")
    }

    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
      print("Card tapped on \(petProfileCardModels[index].name)")
    }
}
