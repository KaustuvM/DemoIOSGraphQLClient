//
//  NetworkManager.swift
//  DemoIOSGraphQLClient
//
//  Created by Kaustuv Mukherjee on 1/7/22.
//

import Foundation
import Apollo

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    lazy var apolloClient = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)
}
