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
    let local: MovieDatabaseDelegate
    
    init(remote: MovieServiceDelegate, local: MovieDatabaseDelegate) {
        self.remote = remote
        self.local = local
    }
    
    func setPopularMovies(movies: [Movie]) {
        print("setPopularMovies")
        _ = self.local.insertOrUpdatePapularMovie(movies: movies)
    }
    
    func getPopularMovies() -> Single<[Movie]> {
                
        return Single.create{ single in
            _ = self.local.getPopularMovie().observe(on: ConcurrentDispatchQueueScheduler(qos: .background)).subscribe { movies in
                print(movies.count)
                print("Single getPopularMovies: \(Thread.current.description)")
                guard movies.count > 0 else {
                    print("fetch from remote")
                    _ = self.remote.getPopularMovies().subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background)).subscribe { remoteMovies in
                        print("Guard getPopularMovies: \(Thread.current.description)")
                        _ = self.local.insertOrUpdatePapularMovie(movies: remoteMovies).subscribe(on: MainScheduler.instance).subscribe {
                            print("local insertOrUpdatePapularMovie: \(Thread.current.description)")
                            single(.success(remoteMovies))
                        } onError: { error in
                            single(.failure(error))
                        }
                    } onFailure: { error in
                        single(.failure(error))
                    }
                    return;
                }

                print("fetch from local \(movies.count)")
                single(.success(movies))
            } onFailure: { error in
                single(.failure(error))
            }
            
            return Disposables.create()
        }
    }
    
}
