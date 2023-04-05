//
//  MovieDetailView.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 26/03/23.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    @State var providers: Providers?
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
                Section {
                    Text(movie.overview ?? "NILL")
                } header: {
                    HStack {
                        Text("Overview")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color.secondary)
                            .padding(.horizontal, 5)
                        Spacer()
                    }
                }
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(providers?.results?.it?.flatrate ?? []) { provider in
                                AsyncImage(
                                    url: URL(string: "https://image.tmdb.org/t/p/original/" + (provider.logoPath ?? "")),
                                    content: { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                            .cornerRadius(8)
                                    },
                                    placeholder: {
                                        Image("poster-placeholder")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(15)
                                            .overlay {
                                                ProgressView()
                                                    .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                                                
                                            }
                                    }
                                )
                            }
                        }
                        .padding(.horizontal, 3)
                    }
                } header: {
                    if !(providers?.results?.it?.flatrate ?? []).isEmpty {
                        HStack {
                            Text(LocalizedStringKey("WatchProviders"))
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(Color.secondary)
                            Spacer()
                        }
                    }
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            Task {
                providers = try await Network.shared.getProviders(for: String(movie.id ?? 9999999))
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(adult: false, backdropPath: "", genreIDS: [], id: 0, originalLanguage: OriginalLanguage.en, originalTitle: "", overview: "", popularity: 2.0, posterPath: "", releaseDate: "2023", title: "Movie Title", video: false, voteAverage: 3.0, voteCount: 99))
    }
}
