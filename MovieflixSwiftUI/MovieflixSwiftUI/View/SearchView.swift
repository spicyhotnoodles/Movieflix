//
//  SearchView.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 26/03/23.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State var searchedMovies: Movies?
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ForEach(searchedMovies?.results ?? []) { movie in
                    NavigationLink<MovieRowCellView, MovieDetailView> {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieRowCellView(movie: movie)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Search")
            .onChange(of: text) { newValue in
                Task {
                    searchedMovies = try await Network.shared.search(for: newValue)
                }
            }
            .autocorrectionDisabled()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
