//
//  QuoteViewModel.swift
//  KanyeSays
//
//  Created by Bartosz Wojtkowiak on 29/12/2021.
//

import Foundation

class QuoteViewModel: ObservableObject {
    
    @Published var quotes: [QuoteModel] = []
    
    init() {
        getQuote()
    }
    
    func updateQuote() {
        guard let url = URL(string: "https://api.kanye.rest") else { return }
        
        downloadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                guard let newQuote = try? JSONDecoder().decode(QuoteModel.self, from: data) else { return }
                DispatchQueue.main.async {
                    self.quotes[0] = newQuote
                }
            } else {
                print("No data returned")
            }
        }
    }
    
    func getQuote() {
        
        guard let url = URL(string: "https://api.kanye.rest") else { return }
        
        downloadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                guard let newQuote = try? JSONDecoder().decode(QuoteModel.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.quotes.append(newQuote)
                }
            } else {
                print("No data returned")
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Error downloading data.")
                    completionHandler(nil)
                    return
                }
            
            completionHandler(data)
        }
        .resume()
    }
}
