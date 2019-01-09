//
//  PlanetViewController.swift
//  PlanetListApp
//
//  Created by iSparshiT on 09/01/19.
//  Copyright © 2019 Samarjeet. All rights reserved.
//

import UIKit

class PlanetViewController: UITableViewController {
    
    var planetsArray = [Result]()
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavBar()
        setupTableView()
        refreshView()

        if planetsArray.count == 0 {
            
            fetchData()

        }
    }
    

    fileprivate func fetchData() {
    
        Service.shared.fetchGenericData(urlString: "https://swapi.co/api/planets") { (planetModel:PlanetModel) in
            
            if let result = planetModel.results {
            DBManager.sharedInstance.savePlanetData(planets: result)
            }
            DispatchQueue.main.async {
                self.refreshView()
            }
        }
        
    }
    
    func refreshView(){
        
        planetsArray = DBManager.sharedInstance.getPlanetData()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetsArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? PlanetCell {
            
            let item = planetsArray[indexPath.row]
            
            cell.planetName = item.name ?? ""
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    fileprivate func setupTableView() {
        tableView.register(PlanetCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    

    fileprivate func setupNavBar() {
        navigationItem.title = "Planets"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

}
class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

