//
//  MovieRowCellView.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 26/03/23.
//

import SwiftUI
import Kingfisher

struct MovieRowCellView: View {
    @Environment(\.colorScheme) var colorScheme
    let movie: Movie
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                KFImage(URL(string: "https://image.tmdb.org/t/p/original/" + (movie.posterPath ?? "")))
                    .placeholder { progress in
                        Image("poster-placeholder")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .overlay {
                                if movie.posterPath != nil {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                                }
                            }
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                VStack(alignment: .leading, spacing: 10) {
                    Text(movie.title ?? "Unknown")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .lineLimit(2)
                    Text(movie.releaseDate ?? "2023-12-31")
                    if movie.overview == "" {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum lorem vel ex dictum, at congue magna ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dui nulla, dictum vel elementum id, mattis porta arcu. Donec lacinia ut quam et convallis. In laoreet vulputate est, in blandit nibh egestas sed. Vestibulum vitae posuere tortor.")
                            .lineLimit(8)
                    } else {
                        Text(movie.overview ?? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum lorem vel ex dictum, at congue magna ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dui nulla, dictum vel elementum id, mattis porta arcu. Donec lacinia ut quam et convallis. In laoreet vulputate est, in blandit nibh egestas sed. Vestibulum vitae posuere tortor.")
                            .lineLimit(8)
                    }
                }
            }
            .padding()
            Divider()
        }
    }
}

struct MovieRowCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowCellView(movie: Movie(adult: false, backdropPath: "", genreIDS: [], id: 0, originalLanguage: OriginalLanguage.en, originalTitle: "", overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur quam eget velit pretium maximus. Etiam dictum feugiat ex. Suspendisse vel lorem sapien. Quisque et blandit quam. Curabitur elit enim.", popularity: 2.0, posterPath: "", releaseDate: "2023", title: "Movie Title", video: false, voteAverage: 3.0, voteCount: 99))
    }
}
