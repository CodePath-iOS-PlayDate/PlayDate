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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Register all custom cells
        self.registerCustomCells()
    }
    
    private func registerCustomCells() {
        tableView.register(UserProfileHeaderCell.self, forCellReuseIdentifier: UserProfileHeaderCell.identifier)
    }

    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            print("Error - Section \(section) numberOfRowsInSection not implemented")
            return 0
        }
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
            break
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return view.bounds.height / 1.8
        case 1:
            break
        case 2:
            break
        case 3:
            break
        default:
            break
        }
        return view.bounds.height / 7
    }
    /*
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
            break
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return view.bounds.height / 1.8
        case 1:
            break
        case 2:
            break
        case 3:
            break
        default:
            break
        }
        return view.bounds.height / 7
    }
     */
}
