//
//  Data.swift
//  MovieflixUIKit
//
//  Created by Pietro Ciuci on 31/03/23.
//

import Foundation

class APIData {
    
    var nowPlayingMovies: Movies?
    
    init() async {
        do {
            try self.nowPlayingMovies = await Network.shared.get()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func searchMovie() {
        
    }
    
}
