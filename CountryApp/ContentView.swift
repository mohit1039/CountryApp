//
//  ContentView.swift
//  CountryApp
//
//  Created by Mohitkumar Gupta on 06/04/24.
//

import SwiftUI
import CountrySchema



struct ContentView: View {
    
    @StateObject private var countryListVM = CountryListViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                
                List(countryListVM.countries, id: \.code) { country in
                    NavigationLink(
                        destination: CountryDetailView(country: country),
                        label: {
                            HStack {
                                Text(country.emoji)
                                Text(country.name)
                            }
                        })
                    
                }.listStyle(.plain)
                
            }
            .onAppear(perform: {
                countryListVM.getAllCountries()
            })
        }
        .navigationTitle("Countries")
    }
}

#Preview {
    ContentView()
}
