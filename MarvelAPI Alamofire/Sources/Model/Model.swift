//
//  Model.swift
//  MarvelAPI Alamofire
//
//  Created by Радик Ахметзянов on 10.11.2022.
//

import Foundation
import Alamofire


struct MarvelInfo: Decodable {
    let data: Heroes
}

struct Heroes: Decodable {
    let results: [Hero]
}

struct Hero: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Decodable {
    let path: String
    let ext: String
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}
