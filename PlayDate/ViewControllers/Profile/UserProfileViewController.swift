//
//  UserProfileViewController.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/21/21.
//

import UIKit

class UserProfileViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Colors.bluePurple
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.shadowColor = .clear
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        
        self.registerCustomCells()
    }
    
    private func registerCustomCells() {
        tableView.register(UserProfileHeaderCell.self, forCellReuseIdentifier: UserProfileHeaderCell.identifier)
        tableView.register(UserProfileViewCell.self, forCellReuseIdentifier: UserProfileViewCell.identifier)
    }

    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserProfileHeaderCell.identifier,
                for: indexPath
            ) as? UserProfileHeaderCell else {
                return UITableViewCell()
            }
            cell.isUserInteractionEnabled = false
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserProfileViewCell.identifier,
                for: indexPath
            ) as? UserProfileViewCell else {
                return UITableViewCell()
            }
            cell.isUserInteractionEnabled = false
            return cell
        case 2:
            break
        case 3:
            break
        default:
            break
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//        case 0:
//            return view.bounds.height / 1.8
//        case 1:
//            return view.bounds.height / 1.8
//        case 2:
//            break
//        case 3:
//            break
//        default:
//            break
//        }
//        return view.bounds.height / 7
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
}
