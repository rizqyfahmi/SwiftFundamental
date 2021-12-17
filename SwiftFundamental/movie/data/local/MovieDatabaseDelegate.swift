//
//  MovieDatabaseDelegate.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import Foundation
import RxSwift

protocol MovieDatabaseDelegate {
    
    func insertOrUpdatePapularMovie(movies: [Movie]) -> Completable
    func getPopularMovie() -> Single<[Movie]>
    func deletePopularMovie(movie: Movie) -> Completable
    
}
