//
//  MovieDetailView.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 26/03/23.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    let defaults = UserDefaults.standard
    @State var providers: Providers?
    @State var credits: Credits?
    var searchHistory: Binding<[Movie]?>?
    let movie: Movie
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 35) {
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
                        Spacer()
                    }
                }
                .padding(.horizontal, 3)
                // MARK: Cast Section
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(credits?.cast ?? []) { `actor` in
                                VStack {
                                    AsyncImage(
                                        url: URL(string: "https://image.tmdb.org/t/p/original/" + (`actor`.profilePath ?? "")),
                                        content: { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .shadow(color: Color.secondary, radius: 2)
                                        },
                                        placeholder: {
                                            Image("actor-placeholder")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .shadow(color: Color.secondary, radius: 2)
                                                .overlay {
                                                    if (`actor`.profilePath != nil) {
                                                        ProgressView()
                                                            .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                                                    }
                                                }
                                        }
                                    )
                                    VStack(spacing: 8) {
                                        Text(`actor`.name ?? "Unknown")
                                            .frame(width: 70)
                                            .truncationMode(.tail)
                                            .lineLimit(2)
//                                        Text(LocalizedStringKey("IsCharacter"))
//                                            .font(.caption)
                                        Divider()
                                            .frame(height: 1)
                                            .overlay(Color(UIColor.systemGray))
                                        if `actor`.character != "" {
                                            Text(`actor`.character ?? "Unknown")
                                                .frame(width: 90)
                                                .frame(maxHeight: .infinity)
                                                .truncationMode(.tail)
                                                .lineLimit(2)
                                                .padding(-15)
                                        } else {
                                            Text("Unknown")
                                                .frame(maxHeight: .infinity)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 3)
                    }
                } header: {
                    HStack {
                        Text("Cast")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color.secondary)
                        Spacer()
                    }
                }
                .padding(.horizontal, 3)
                // MARK: Watch Providers Section
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
                .padding(.horizontal, 3)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            Task {
                providers = try await Network.shared.getProviders(for: String(movie.id ?? 0000000))
                credits = try await Network.shared.getCredits(for: String(movie.id ?? 0000000))
            }
            if !((searchHistory?.wrappedValue?.contains(where: { $0.id == movie.id })) != nil && (searchHistory?.wrappedValue?.contains(where: { $0.id == movie.id }))!) {
                if (searchHistory?.wrappedValue?.count ?? 0) > 6 {
                    searchHistory?.wrappedValue?.remove(at: 0)
                }
                searchHistory?.wrappedValue?.append(movie)
//                defaults.set(searchHistory?.wrappedValue, forKey: "Saved History")
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(searchHistory: .constant([]), movie: Movie(adult: false, backdropPath: "", genreIDS: [], id: 0, originalLanguage: OriginalLanguage.en, originalTitle: "", overview: "", popularity: 2.0, posterPath: "", releaseDate: "2023", title: "Movie Title", video: false, voteAverage: 3.0, voteCount: 99))
    }
}

extension MovieDetailView {
    func addToHistory() {
        
    }
}
