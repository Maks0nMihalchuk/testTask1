//
//  TableTableViewController.swift
//  testTask
//
//  Created by maks on 09.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import UIKit
import Alamofire
import WebKit

class TableTableViewController: UITableViewController {

    let arrayCategories = ["arts", "automobiles", "books", "business", "climate"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let arrayCategoriesView = arrayCategories[indexPath.row]
        cell.textLabel?.text = arrayCategoriesView
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsTableViewController()
        let cell = tableView.cellForRow(at: indexPath)
        vc.name = cell?.textLabel?.text ?? ""
        self.present(vc, animated: true, completion: nil)
        
        
    }
}
