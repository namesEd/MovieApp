//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Edward Kyles on 6/18/23.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    
    var cancellable = Set<AnyCancellable>()
    let service = MovieService()
    
    func getMovies(_ search: String) {
        service.fetchMovies(search)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { movies in
                self.movies = movies
            }
            .store(in: &cancellable)
        
    }
}
