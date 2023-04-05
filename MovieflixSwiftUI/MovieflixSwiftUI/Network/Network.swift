//
//  Network.swift
//  MovieflixSwiftUI
//
//  Created by Pietro Ciuci on 26/03/23.
//

import Foundation
import SwiftUI

class Network: NSObject, ObservableObject {
    
    // API Key ef1d335d746553ee2fcd7f8c03cf8614
    
    /// Create a single instance of the Network class
    static let shared = Network()
    
    /// Create a urlSession object, use this to perform request
    let session: URLSession = URLSession(configuration: .default)
    
    /// API URL for getting now playing movies
    var urlComponent = URLComponents(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=ef1d335d746553ee2fcd7f8c03cf8614&language=\(LocalizedStringKey("APILanguage").stringValue())&page=1")
    
    /// API URL for searching movies
    // https://api.themoviedb.org/3/search/movie?api_key=ef1d335d746553ee2fcd7f8c03cf8614&language=en-US&query=<<query>>&page=1&include_adult=false
    
    
    func get() async throws -> Movies? {
        let request = buildRequest(component: urlComponent!)
        let data = try await perform(request: request)
        return try JSONDecoder().decode(Movies.self, from: data)
    }
    
    func search(for title: String) async throws -> Movies? {
        var url = "https://api.themoviedb.org/3/search/movie?api_key=ef1d335d746553ee2fcd7f8c03cf8614&language=\(LocalizedStringKey("APILanguage").stringValue())&query=<<query>>&page=1&include_adult=false"
        url = url.replacingOccurrences(of: "<<query>>", with: title)
        let urlComponent = URLComponents(string: url)
        let request = buildRequest(component: urlComponent!)
        let data = try await perform(request: request)
        do {
            let loaded = try JSONDecoder().decode(Movies.self, from: data)
            return loaded
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getProviders(for movieID: String) async throws -> Providers? {
        var url = "https://api.themoviedb.org/3/movie/<<movie_id>>/watch/providers?api_key=ef1d335d746553ee2fcd7f8c03cf8614"
        url = url.replacingOccurrences(of: "<<movie_id>>", with: movieID)
        let urlComponent = URLComponents(string: url)
        let request = buildRequest(component: urlComponent!)
        let data = try await perform(request: request)
        do {
            let loaded = try JSONDecoder().decode(Providers.self, from: data)
            return loaded
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getCredits(for movieID: String) async throws -> Credits? {
        var url = "https://api.themoviedb.org/3/movie/<<movie_id>>/credits?api_key=ef1d335d746553ee2fcd7f8c03cf8614"
        url = url.replacingOccurrences(of: "<<movie_id>>", with: movieID)
        let urlComponent = URLComponents(string: url)
        let request = buildRequest(component: urlComponent!)
        let data = try await perform(request: request)
        do {
            let loaded = try JSONDecoder().decode(Credits.self, from: data)
            return loaded
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}

extension LocalizedStringKey {
    var stringKey: String? {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }
}

extension String {
    static func localizedString(for key: String, locale: Locale = .current) -> String {
        let language = locale.language.languageCode?.identifier
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        return localizedString
    }
}

extension LocalizedStringKey {
    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey!, locale: locale)
    }
}
