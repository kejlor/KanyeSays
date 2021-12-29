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
        VStack {
            List {
                Section {
                    ForEach(vm.quotes) { quote in
                        Text(quote.quote)
                            .font(.headline)
                    }
                } header: {
                    Text("Kanye says: ")
                }
            }
            Button {
                vm.updateQuote()
            } label: {
                Image(systemName: "goforward")
                    .font(.title)
                    .foregroundColor(.white)
                    .background(
                    Circle()
                        .frame(width: 500, height: 50)
                    )
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
