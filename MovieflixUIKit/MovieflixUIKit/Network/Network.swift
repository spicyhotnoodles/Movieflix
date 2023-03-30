//
//  Network.swift
//  MovieflixUIKit
//
//  Created by Pietro Ciuci on 26/03/23.
//

import Foundation

class Network: NSObject, ObservableObject {
    
    /// Create a single instance of the Network class
    static let shared = Network()
    
    /// Create a urlSession object, use this to perform request
    let session: URLSession = URLSession(configuration: .default)
    
    /// API URL for getting now playing movies
    var urlComponent = URLComponents(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=ef1d335d746553ee2fcd7f8c03cf8614&language=en-US&page=1")
    
    /// API URL for searching movies
    // https://api.themoviedb.org/3/search/movie?api_key=ef1d335d746553ee2fcd7f8c03cf8614&language=en-US&query=<<query>>&page=1&include_adult=false
    
    
    func get() async throws -> Movies? {
        let request = buildRequest(component: urlComponent!)
        let data = try await perform(request: request)
        return try JSONDecoder().decode(Movies.self, from: data)
    }
    
    func search(for title: String) async throws -> Movies? {
        var url = "https://api.themoviedb.org/3/search/movie?api_key=ef1d335d746553ee2fcd7f8c03cf8614&language=en-US&query=<<query>>&page=1&include_adult=false"
        url = url.replacingOccurrences(of: "<<query>>", with: title)
        let urlComponent = URLComponents(string: url)
        let request = buildRequest(component: urlComponent!)
        let data = try await perform(request: request)
        do {
            let loaded = try JSONDecoder().decode(Movies.self, from: data)
            return loaded
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
    }
    
}
