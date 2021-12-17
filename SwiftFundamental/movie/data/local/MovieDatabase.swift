//
//  MovieDatabase.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

class MovieDatabase: MovieDatabaseDelegate {
    
    static let realm: Realm = try! Realm()
    
    func insertOrUpdatePapularMovie(movies: [Movie]) -> Completable {
        return Completable.create { completable in
            print("Insert into local: \(Thread.current)")
            do {
                try MovieDatabase.realm.write {
                    MovieDatabase.realm.add(movies, update: .all)
                    completable(.completed)
                }
            } catch {
                print("Err!")
                completable(.error(error))
            }
            
            return Disposables.create()
        }
    }
    
    func getPopularMovie() -> Single<[Movie]> {
        
        let result: [Movie] = Array(MovieDatabase.realm.objects(Movie.self))
        
        return Single.just(result)
    }
    
    func deletePopularMovie(movie: Movie) -> Completable {
        return Completable.create { completable in

            do {
                try MovieDatabase.realm.write {
                    MovieDatabase.realm.delete(movie)
                    completable(.completed)
                }
            } catch {
                completable(.error(error))
            }
            
            return Disposables.create {
                MovieDatabase.realm.cancelWrite()
            }
        }
    }
    
    
}
