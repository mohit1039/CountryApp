//
//  CountryListViewModel.swift
//  CountryApp
//
//  Created by Mohitkumar Gupta on 07/04/24.
//

import Foundation
import Apollo
import CountrySchema

class CountryListViewModel: ObservableObject {
    
    @Published var countries: [CountryViewModel] = []
    
    func getAllCountries() {
        
        Network.shared.apollo.fetch(query: GetAllCountriesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                
                if let countries = graphQLResult.data?.countries {
                    DispatchQueue.main.async {
                        self.countries = countries.map(CountryViewModel.init)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
}


struct CountryViewModel {
    
    fileprivate let country: GetAllCountriesQuery.Data.Country
    
    var code: String {
        country.code
    }
    
    var name: String {
        country.name
    }
    
    var emoji: String {
        country.emoji
    }
    
}

extension CountryViewModel {
    
    static var defaultCountry: CountryViewModel {
        CountryViewModel(country: try! GetAllCountriesQuery.Data.Country(data: ["name" : "US"]))
    }
    
}

