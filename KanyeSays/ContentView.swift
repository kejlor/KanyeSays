//
//  ContentView.swift
//  KanyeSays
//
//  Created by Bartosz Wojtkowiak on 29/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = QuoteViewModel()
    
    var body: some View {
        List {
            ForEach(vm.quotes) { quote in
                Text(quote.quote)
            }
        }
        Button {
            vm.updateQuote()
        } label: {
            Text("Get Kanye quote")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
