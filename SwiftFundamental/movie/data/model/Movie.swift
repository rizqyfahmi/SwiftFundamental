//
//  Movie.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import Foundation
import RealmSwift

class Movie: Object, Codable, Identifiable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var originalTitle: String = ""
    @objc dynamic var originalLanguage: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var posterPath: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var video: Bool = false
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var voteCount: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
