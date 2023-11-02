//
//  HomeViewController.swift
//  ApiStudyApp
//
//  Created by NOZOMI ISHII on 2023/11/02.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataList: [DataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        profile()
        

    }
    
    func profile() {
        for i in 1...5 {
           let dataModel = DataModel(profileTitol: "このプロフィールは\(i)番目です。")
            print(dataModel)
            dataList.append(dataModel)

        }
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let dataModel: DataModel = dataList[indexPath.row]
        cell.textLabel?.text = dataModel.profileTitol
        return cell
    }
    
    
}
