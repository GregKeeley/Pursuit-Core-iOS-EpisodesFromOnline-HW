//
//  ViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var shows = [Show]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func searchShows(_ searchQuery: String) {
        ShowSearchAPI.searchShow(for: searchQuery) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error: \(appError)")
            case .success(let show):
                DispatchQueue.main.async {
                    self?.shows = show
                    print(self?.shows.count)
                }
            }
        }
    }
    
}

extension ShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as? ShowSearchCell else {
            fatalError("Failed to dequeue showCell")
        }
        let show = shows[indexPath.row]
        cell.configureCell(for: show)
        return cell
    }
}

extension ShowViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchShows(searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchShows(searchBar.text ?? "Futurama")
        searchBar.resignFirstResponder()
    }
}
