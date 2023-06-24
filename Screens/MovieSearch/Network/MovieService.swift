    //
    //  MovieService.swift
    //  MovieApp
    //
    //  Created by Edward Kyles on 6/18/23.
    //

import Foundation
import Combine
import SwiftUI

class MovieService {
    var cancellable = Set<AnyCancellable>()
    
    let urlString = "https://omdbapi.com/?i=tt3896198&apikey=97f4f729&s="
    
    //TODO: fix the memory leak
    //https://omdbapi.com/?i=tt3896198&apikey=97f4f729&s=Titanic
    func fetchMovies(_ searchText: String) -> Future<[Movie], Error> {
        return Future { promise in
            let finalUrlString = self.urlString + searchText // leaking memory
            let url = URL(string: finalUrlString)!
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data } //Data
                .decode(type: MovieResponse.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let err):
                        promise(.failure(err))
                    }
                } receiveValue: {response in
                    promise(.success(response.search))
                }
                .store(in: &self.cancellable)
        }
    }
}
