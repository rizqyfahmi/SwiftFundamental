//
//  MovieService.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import Foundation
import RxSwift
import RxCocoa

class MovieService: MovieServiceDelegate {
    
    static let apiKey = "ab702cb6d7fd0c3b639e2b280bc79219"
    static let baseURL = "https://api.themoviedb.org/3/movie"
    
    func getPopularMovies() -> Single<[Movie]> {
        print("Remote getPopularMovies: \(Thread.current.description)")
        return Single.create { single in
            
            var components = URLComponents(string: "\(MovieService.baseURL)/popular")!
            components.queryItems = [
                URLQueryItem(name: "api_key", value: MovieService.apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "1")
            ]
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    return single(.failure(error))
                }

                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let response: MovieResponse = try decoder.decode(MovieResponse.self, from: data!)
                    single(.success(response.results))
                } catch {
                    return single(.failure(error))
                }
                
            }
            
            task.resume()
            
            return Disposables.create{
                task.cancel()
            }
        }
    }
    
}
