//
//  APIError.swift
//  MovieApp
//
//  Created by Edward Kyles on 7/9/23.
//

import Foundation

enum APIError: Error {
    case decodingError, invalidURL
    
    var description: String {
        switch self {
        case .decodingError:
            return "decoding error"
        case .invalidURL:
            return "invalid url"
        }
    }
}
