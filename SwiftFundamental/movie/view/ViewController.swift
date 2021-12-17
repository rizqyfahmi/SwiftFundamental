//
//  ViewController.swift
//  SwiftFundamental
//
//  Created by Ahmad Yulia Rizqy Fahmi on 15/12/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let movieViewModel = MovieViewModel(
        repository: MovieRepository(
            remote: MovieService(), local: MovieDatabase()
        )
    )
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieViewModel.getPopularMovies().disposed(by: disposeBag)
        
        movieViewModel.movies
            .asObserver()
            .subscribe(onNext: { items in
//                print(items)
            })
            .disposed(by: disposeBag)
        
        
        
    }
}
