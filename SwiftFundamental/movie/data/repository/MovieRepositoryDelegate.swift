//
//  MovieRepositoryDelegate.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import Foundation
import RxSwift

protocol MovieRepositoryDelegate {
    
    func setPopularMovies(movies: [Movie])
    func getPopularMovies() -> Single<[Movie]>
    
}
