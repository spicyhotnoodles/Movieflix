//
//  MovieDetailView.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 26/03/23.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                KFImage(URL(string: "https://image.tmdb.org/t/p/original/" + (movie.posterPath ?? "")))
                    .placeholder { progress in
                        Image("poster-placeholder")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .overlay {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                                
                            }
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                Text(movie.title ?? "Unknown")
                    .font(.largeTitle)
                    .bold()
                Text(movie.overview ?? "NILL")
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(adult: false, backdropPath: "", genreIDS: [], id: 0, originalLanguage: OriginalLanguage.en, originalTitle: "", overview: "", popularity: 2.0, posterPath: "", releaseDate: "2023", title: "Movie Title", video: false, voteAverage: 3.0, voteCount: 99))
    }
}
