//
//  CountryDetailView.swift
//  CountryApp
//
//  Created by Mohitkumar Gupta on 07/04/24.
//

import SwiftUI
import CountrySchema
struct CountryDetailView: View {
    
    let country: CountryViewModel
    @StateObject private var countryDetailVM = CountryDetailViewModel()
    
    var body: some View {
        VStack {
            Text(countryDetailVM.name)
            Text(countryDetailVM.capital)
            List(countryDetailVM.states, id: \.id) { state in
                Text(state.name)
            }
        }.onAppear(perform: {
            self.countryDetailVM.getCountryDetailsByCode(code: country.code)
        })
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: CountryViewModel.defaultCountry)
    }
}
