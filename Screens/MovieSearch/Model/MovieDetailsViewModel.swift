//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Edward Kyles on 6/23/23.
//

import Foundation

final class MovieDetailsViewModel: ObservableObject {
    
    @Published var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
