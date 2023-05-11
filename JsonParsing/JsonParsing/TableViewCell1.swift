//
//  TableViewCell1.swift
//  JsonParsing
//
//  Created by Harsh Tiwari on 21/04/23.
//

import UIKit

class TableViewCell1: UITableViewCell {
    
    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var eMail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
        
    }
    func populateCellData(data : DataJson){
        let url = URL(string: data.avatar)
        pic.kf.setImage(with: url)
        firstName.text = data.firstName
        lastName.text = data.lastName
        id.text = String(data.id)
        eMail.text = data.email
        
    }
}
