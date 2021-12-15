//
//  MovieRepository.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import Foundation
import RxSwift

class MovieRepository: MovieRepositoryDelegate {
    
    let remote: MovieServiceDelegate
    
    init(remote: MovieServiceDelegate) {
        self.remote = remote
    }
    
    func getPopularMovies() -> Single<[Movie]> {
        return remote.getPopularMovies()
    }
    
}
