//
//  Apollo.swift
//  CountryApp
//
//  Created by Mohitkumar Gupta on 06/04/24.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    private init() {
        
    }
    
}
