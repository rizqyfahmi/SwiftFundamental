//
//  MovieResponse.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
}
