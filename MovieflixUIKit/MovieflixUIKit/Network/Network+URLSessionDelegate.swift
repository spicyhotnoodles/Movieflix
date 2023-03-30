//
//  Network+URLSessionDelegate.swift
//  MovieflixUIKit
//
//  Created by Pietro Ciuci on 26/03/23.
//

import Foundation

extension Network {
    
    ///This function allows you to be able to create the URLRequest object, which can be used to be able to make a network call
    ///
    /// - Parameters:
    ///   - method: The HTTP Method
    ///   - path: The path of the request
    ///   - apiKey: The Bearer Token useful for authentication of the request if needed.
    ///   - queryItems: The Query items of the request if needed.
    ///   - body: The body of the request if needed.

    /*func buildRequest(method: String, path: String, apiKey: String? = nil,
                      queryItems: [URLQueryItem]? = nil,
                      body: (any Codable)? = nil) -> URLRequest? {
        urlComponent?.path = path
        
        if let queryItems = queryItems {
            urlComponent?.queryItems = queryItems
        }
        guard let theURL = urlComponent?.url else { return nil }
        var request = URLRequest(url: theURL)
        request.httpMethod = method
        
        return request
    }*/
    
    func buildRequest(component: URLComponents) -> URLRequest? {
        let request = URLRequest(url: component.url!)
        return request
    }
    
    /// This function allows you to be able to perform the request after executing it.
    ///
    /// This function is implemented in three different ways based on the patter design.
    ///
    /// - Parameters:
    /// - request: The `URLRequest` that needs to be performed
    /// - Returns: The data received from the network call
    func perform(request: URLRequest?) async throws -> Data {
        guard let request else {
            throw NetworkError.badRequest // Error handling
        }
        return try ResponseHandler.shared.mapResponse(await session.data(for: request))
    }
    
}
