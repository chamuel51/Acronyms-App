//
//  ContentView.swift
//  Acronyms App
//
//  Created by chamuel castillo on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var acronymListVM = AcronymListViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            //TODO: Move ListView to another file
            List {
                ForEach(acronymListVM.acronymsList, id:\.acronymID) { acronym in
                    Text(acronym.acronymFullForm)
                }
            }
            .navigationTitle("Acronyms")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { value in
            Task {
                await acronymListVM.search(word: value)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
