//
//  TabView.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 26/03/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NowMoviesView()
                .tabItem {
                    Label("In Theaters", systemImage: "ticket.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
