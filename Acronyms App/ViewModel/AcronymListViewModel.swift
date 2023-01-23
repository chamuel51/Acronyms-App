//
//  ContentViewModel.swift
//  Acronyms App
//
//  Created by chamuel castillo on 1/20/23.
//

import Foundation

@MainActor
class AcronymListViewModel: ObservableObject {
    
//    @Published var definition: String = ""
//
//    public let apiRequest: APIRequest
//
//    init(apiRequest: APIRequest){
//        self.apiRequest = apiRequest
//    }
    @Published var acronymsList: [AcronymViewModel] = []
    func search(word: String) async {
        do {
            let acronymsList = try await APIRequest().fetch(searchTerm: word)
            self.acronymsList = acronymsList.map(AcronymViewModel.init)
        } catch {
            print(error)
        }
    }
    
    struct AcronymViewModel {
        let acronym: Acronym
        
        var acronymFullForm: String {
            acronym.term
        }
        
        var acronymFrecuency: Int {
            acronym.frequency
        }
        var acronymFirstUse: Int {
            acronym.since
        }
        
        var acronymID: String {
            acronym.id
        }
    }
}
