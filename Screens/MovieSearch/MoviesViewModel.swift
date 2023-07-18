//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Edward Kyles on 6/18/23.
//

import Foundation
import Combine

enum AsynchStatus {
    case initial, loading, loaded, error
}

class MoviesViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    @Published var status: AsynchStatus = .initial
    
    var cancellable = Set<AnyCancellable>()
  //let service = MovieService()
    let service: MovieServiceProtocol

    init(service: MovieServiceProtocol) {
        self.service = service
    }

    
    func getMovies(_ search: String) {
        status = .loading
        service.fetchMovies(search)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                    self?.status = .error
                }
            } receiveValue: { movies in
                self.movies = movies
            }
            .store(in: &cancellable)
        
    }
}
