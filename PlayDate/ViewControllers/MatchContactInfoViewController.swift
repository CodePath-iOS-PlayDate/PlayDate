//
//  MatchContactInfoViewController.swift
//  PlayDate
//
//  Created by Michael Cubero on 11/28/21.
//

import UIKit

class MatchContactInfoViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Match"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Colors.bluePurple
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.shadowColor = .clear
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        configureItems()
        self.registerCustomCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
    }
    
    private func registerCustomCells() {
        tableView.register(MatchHeaderTableViewCell.self, forCellReuseIdentifier: MatchHeaderTableViewCell.identifier)
        tableView.register(MatchPicturesTableViewCell.self, forCellReuseIdentifier: MatchPicturesTableViewCell.identifier)
        tableView.register(MatchInfoTableViewCell.self, forCellReuseIdentifier: MatchInfoTableViewCell.identifier)
    }
    
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
                    withIdentifier: MatchHeaderTableViewCell.identifier,
                    for: indexPath
                ) as? MatchHeaderTableViewCell else {
                    return UITableViewCell()
                }
                cell.isUserInteractionEnabled = true
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: MatchPicturesTableViewCell.identifier,
                    for: indexPath
                ) as? MatchPicturesTableViewCell else {
                    return UITableViewCell()
                }
                cell.isUserInteractionEnabled = false
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: MatchInfoTableViewCell.identifier,
                    for: indexPath
                ) as? MatchInfoTableViewCell else {
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
    
    // Back button at the navigation bar
    private func configureItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", image: nil, primaryAction: nil, menu: nil)
    }

}

