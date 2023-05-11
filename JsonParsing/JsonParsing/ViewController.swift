//
//  ViewController.swift
//  JsonParsing
//
//  Created by Anarock on 20/04/23.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let url="https://reqres.in/api/users?page=2"
    var jsondata:NSDictionary = [:]
    var rawdata:[NSDictionary] = []
    var objBody:Body = Body(val: [:])
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request(url, method: .get).response{
            resp in
            switch resp.result{
            case .success(let data):
                do{
                    self.jsondata = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions(rawValue: 0)) as! NSDictionary
                    
                    self.objBody = Body(val: self.jsondata)
                    self.tableView.reloadData()
                }catch{
                    print(error)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "TableViewCell1")
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objBody.datajson.count
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1", for: indexPath) as! TableViewCell1
        cell.populateCellData(data: self.objBody.datajson[indexPath.row])
        return cell
    }
}

