//
//  NowMoviesView.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 26/03/23.
//

import SwiftUI

struct NowMoviesView: View {
    @State var nowPlayingMovies: Movies?
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ForEach(nowPlayingMovies?.results ?? []) { movie in
                    NavigationLink<MovieRowCellView, MovieDetailView> {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieRowCellView(movie: movie)
                    }
                }
                .buttonStyle(.plain)
            }
            .navigationTitle(LocalizedStringKey("TheatersView"))
        }
        .onAppear {
            Task {
                nowPlayingMovies = try await Network.shared.get()
            }
        }
        .refreshable {
            Task {
                nowPlayingMovies = try await Network.shared.get()
            }
        }
    }
}

struct NowMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        NowMoviesView()
    }
}
