//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Edward Kyles on 6/23/23.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.movie.poster)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250, alignment: .center)
                    .background(Color(.red))
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color(.blue))
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(viewModel.movie.title)
                    .font(.largeTitle)
                HStack {
                    Text(viewModel.movie.year)
                        .font(.title2)
                    Spacer()
                    Text(viewModel.movie.type)
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .padding(15)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(viewModel: MovieDetailsViewModel(movie: Movie(id: "1", title: "You and Me", type: "movie", poster: "https://example.com/image.jpg", year: "1982")))
    }
}
