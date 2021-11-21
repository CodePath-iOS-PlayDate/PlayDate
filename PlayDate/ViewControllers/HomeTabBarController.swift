//
//  HomeTabBarController.swift
//  PlayDate
//
//  Created by Gustavo Cornejo on 11/21/21.
//

import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let item1 = UINavigationController(rootViewController: FeedViewController())
        let item2 = UINavigationController(rootViewController: MatchListViewController())
        let item3 = UINavigationController(rootViewController: UserProfileViewController())
        
        let icon1 = UITabBarItem(title: "Feed", image: UIImage(named: "feed.png"), selectedImage: UIImage(named: "feed-selected.png"))
        let icon2 = UITabBarItem(title: "Matches", image: UIImage(named: "matches.png"), selectedImage: UIImage(named: "matches-selected.png"))
        let icon3 = UITabBarItem(title: "Profile", image: UIImage(named: "profile.png"), selectedImage: UIImage(named: "profile-selected.png"))
        
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        item3.tabBarItem = icon3
        
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
