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
        
        self.registerCustomCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
    }
    
    private func registerCustomCells() {
        tableView.register(UserProfileHeaderCell.self, forCellReuseIdentifier: UserProfileHeaderCell.identifier)
        tableView.register(UserProfileViewCell.self, forCellReuseIdentifier: UserProfileViewCell.identifier)
        tableView.register(PetProfileViewCell.self, forCellReuseIdentifier: PetProfileViewCell.identifier)
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
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PetProfileViewCell.identifier,
                for: indexPath
            ) as? PetProfileViewCell else {
                return UITableViewCell()
            }
            cell.isUserInteractionEnabled = false
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
}
