//
//  ResponseModel.swift
//  ATLLessonNetworking
//
//  Created by Ayan on 24.11.23.
//

import Foundation

struct Post: Codable {
    let userID: Int?
    let id: Int?
    let title: String?
    let body: String?
    
    //USE: quicktype.io to create response model
   //NOTE: Always make them options just in case of not returning any data
   // body-deki ile birebir ele
}

//{
//   "userId": 1,
//   "id": 1,
//   "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//   "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
// }
