//
//  MovieViewModel.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import Foundation
import RxSwift

class MovieViewModel {
    
    let repository: MovieRepositoryDelegate
    let movies = PublishSubject<[Movie]>();
    
    init(repository: MovieRepositoryDelegate) {
        self.repository = repository
    }
    
    func getPopularMovies() -> Disposable {
        print("getPopularMovies: \(Thread.current.description)")
        return repository.getPopularMovies().subscribe(onSuccess: { [weak self] movies in
            print("subscribe getPopularMovies: \(Thread.current.description)")
            self?.movies.onNext(movies)
        }, onFailure: { [weak self] _ in
            self?.movies.onNext([])
        })
    }
    
}

