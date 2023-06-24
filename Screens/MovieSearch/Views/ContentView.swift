//
//  ContentView.swift
//  MovieApp
//
//  Created by Edward Kyles on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = "Titanic"
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                searchField
                    .onChange(of: searchText) { newValue in
                        viewModel.getMovies(newValue)
                    }
                listView()
            }
            .navigationTitle("Movies")
            .onAppear {
                viewModel.getMovies(searchText)
            }

        }
    }

    private func listView() -> some View {
        List(viewModel.movies) { movie in
            NavigationLink {
                MovieDetailsView(viewModel: MovieDetailsViewModel(movie: movie))
            } label: {
                MovieCell(movie: movie)
            }
        }
    }
    
 
    private var searchField: some
    View {
        TextField("Search for movie", text:$searchText)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
