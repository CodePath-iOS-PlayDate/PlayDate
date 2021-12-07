//
//  HomeTabBarController.swift
//  PlayDate
//
//  Created by Gustavo Cornejo on 11/21/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let item1 = UINavigationController(rootViewController: FeedViewController())
        let icon1 = UITabBarItem(title: "Feed", image: UIImage(named: "feed.png"), selectedImage: UIImage(named: "feed-selected.png"))
        item1.tabBarItem = icon1
        item1.navigationItem.largeTitleDisplayMode = .always
        item1.navigationBar.prefersLargeTitles = true
        
        let item2 = UINavigationController(rootViewController: MatchListViewController())
        let icon2 = UITabBarItem(title: "Matches", image: UIImage(named: "matches.png"), selectedImage: UIImage(named: "matches-selected.png"))
        item2.tabBarItem = icon2
        item2.navigationItem.largeTitleDisplayMode = .always
        item2.navigationBar.prefersLargeTitles = true
        
        let item3 = UINavigationController(rootViewController: UserProfileViewController())
        let icon3 = UITabBarItem(title: "Profile", image: UIImage(named: "profile.png"), selectedImage: UIImage(named: "profile-selected.png"))
        item3.tabBarItem = icon3
        item3.navigationItem.largeTitleDisplayMode = .always
        item3.navigationBar.prefersLargeTitles = true
        
        let controllers = [item1 , item2, item3] 
        self.viewControllers = controllers
    }

    //Delegate method
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
      print("Should select viewController: \(viewController.title ?? "") ?")
      return true;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
