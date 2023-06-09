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
    @State var searchHistory: [Movie]? = []
    let defaults = UserDefaults.standard
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if (text.isEmpty) {
                    ForEach(searchHistory?.reversed() ?? []) { movie in
                        NavigationLink<MovieRowCellView, MovieDetailView> {
                            MovieDetailView(searchHistory: $searchHistory, movie: movie)
                        } label: {
                            MovieRowCellView(movie: movie)
                        }
                    }
//                    .onDelete(perform: { index in
//                        searchHistory?.remove(atOffsets: index)
//                    })
                    .buttonStyle(PlainButtonStyle())
                } else {
                    ForEach(searchedMovies?.results ?? []) { movie in
                        NavigationLink<MovieRowCellView, MovieDetailView> {
                            MovieDetailView(searchHistory: $searchHistory, movie: movie)
                        } label: {
                            MovieRowCellView(movie: movie)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .onAppear {
                if let savedHistory = defaults.object(forKey: "searchHistory") as? Data {
                    let decoder = JSONDecoder()
                    if let loadedHistory = try? decoder.decode([Movie].self, from: savedHistory) {
                        searchHistory = loadedHistory
                    }
                }
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle(LocalizedStringKey("SearchView"))
            .onChange(of: text) { newValue in
                Task {
                    searchedMovies = try await Network.shared.search(for: newValue)
                }
            }
            .autocorrectionDisabled()
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(LocalizedStringKey("Clean")) {
                        searchHistory?.removeAll()
                        do {
                            let encodedData = try JSONEncoder().encode(searchHistory)
                            defaults.set(encodedData, forKey: "searchHistory")
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
