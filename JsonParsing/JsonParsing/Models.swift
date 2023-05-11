//
//  Models.swift
//  JsonParsing
//
//  Created by Anarock on 20/04/23.
//

import Foundation

struct Body{
    let pages:Int
    let perPage:Int
    let wordTotal:Int
    let totalPages:Int
    let datajson: [DataJson]
    let support:Support?
    init(val: NSDictionary) {
        self.pages = val["page"] as? Int ?? 0
        self.perPage = val["per_page"] as? Int ?? 0
        self.wordTotal = val["total"] as? Int ?? 0
        self.totalPages = val["total_pages"] as? Int ?? 0
        self.support = Support(val: val["support"] as? NSDictionary ?? [:])
        
        var jsonData: [DataJson] = []
        let rawData = val.value(forKey: "data") as? [NSDictionary] ?? []
        for raw in rawData {
            jsonData.append(DataJson(data: raw))
        }
        self.datajson = jsonData
    }
}



struct DataJson{
    let id:Int
    let email:String
    let firstName:String
    let lastName:String
    let avatar:String
    
    init(data: NSDictionary) {
        self.email = data["email"] as? String ?? ""
        self.id = data["id"] as? Int ?? 0
        self.firstName = data["first_name"] as? String ?? ""
        self.lastName = data["last_name"] as? String ?? ""
        self.avatar = data["avatar"] as? String ?? ""
    }
}



struct Support{
    let url:String
    let text:String
    init(val: NSDictionary) {
        self.url = val["url"] as? String ?? ""
        self.text = val["text"] as? String ?? ""
    }
}

