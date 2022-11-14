//
//  Extension.swift
//  MarvelAPI Alamofire
//
//  Created by Радик Ахметзянов on 14.11.2022.
//

import Foundation

extension Date {
    public func currentTimeInMillis() -> Int64 {
        return Int64(timeIntervalSince1970 * 1000)
    }
}
