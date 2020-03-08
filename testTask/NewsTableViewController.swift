//
//  NewsTableViewController.swift
//  testTask
//
//  Created by maks on 09.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        Network.newsTitleParsing(categories: name) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Network.titlesNews.results.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNews = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath)
        
        let arrayNewsTitles = Network.titlesNews.results[indexPath.row].title
        cellNews.textLabel?.text = arrayNewsTitles
        return cellNews
    }
    
    
    
    
}
