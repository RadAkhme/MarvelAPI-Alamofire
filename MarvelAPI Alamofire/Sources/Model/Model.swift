//
//  Model.swift
//  MarvelAPI Alamofire
//
//  Created by Радик Ахметзянов on 10.11.2022.
//

import Foundation

struct Heroes: Decodable {
    var results: [Hero]
}

struct Hero: Decodable {
    var name: String
    var description: String
    var thumbnail: String?
    
    
    
}
