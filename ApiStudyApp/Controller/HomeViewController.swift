//
//  HomeViewController.swift
//  ApiStudyApp
//
//  Created by NOZOMI ISHII on 2023/11/02.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
        
    var dataModel: [QiitaStruct] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "QiitaAPI"
        tableView.dataSource = self
        tableView.frame = view.frame
        view.addSubview(tableView)
        QiitaViewModel.fetchArticle(completion: { (dataModel) in
            self.dataModel = dataModel
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let qiitaDataModel: QiitaStruct = dataModel[indexPath.row]
        cell.textLabel?.text = qiitaDataModel.title
        cell.detailTextLabel?.text = qiitaDataModel.user.name
        return cell
    }
    
    
}
