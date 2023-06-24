//
//  MovieCell.swift
//  MovieApp
//
//  Created by Edward Kyles on 6/18/23.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
            HStack {
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 120)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                } placeholder: {
                    Image(systemName: "photo")
                }
                HStack {
                    VStack (spacing: 10){
                        Text(movie.title)
                        Text(movie.year)
                    }
                    Spacer()
                    Text(movie.title)
                }
            }
        }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie.mock)
    }
}
