//
//  ContentView.swift
//  Cari Kopi
//
//  Created by Faizhar Riskisyah on 19/11/22.
//

import SwiftUI

struct ContentView: View {
    
@State private var searchText:String = ""

private var coffeeShopSearchResults: [Coffeeshop] {
    let results = Coffeeshop.CoffeeshopProvider.all()
    
    if searchText.isEmpty {
        return results
    }
    
    return results.filter{
        $0.name.lowercased().contains(searchText.lowercased())
    }
    
}
    
    private var coffeeShopSuggestedResults: [Coffeeshop] {
        if searchText.isEmpty{
            return []
        }
        return coffeeShopSearchResults
    }

    var body: some View {
        NavigationStack{
            
            List(coffeeShopSearchResults){ result in
                NavigationLink(destination: {
                    DetailView(coffeeDetail: result)
                }){
                    
                HStack{
                    Image(result.image).resizable()
                    .scaledToFit()
                    .frame(width: 120 )
                    .cornerRadius(20)
                    VStack(alignment: .leading){
                        Text("\(result.name) ")
                            .fontWeight(.bold)
                            .font(.title3)
                        Spacer()
                        Text("\(result.location)")
                            .lineLimit(2)
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                        Spacer()
                        Text("Rating 4/5").font(.caption).foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    Image(systemName: "chevron.right").foregroundColor(.gray)
                }
                }
                
            }.navigationTitle("Coffeeshop")
                .searchable(text: $searchText, placement:
                        .navigationBarDrawer(displayMode: .always), prompt: "Search Coffeeshops"){
                            ForEach(coffeeShopSuggestedResults) { result in
                                Text("Looking for \(result.name)?").foregroundColor(.blue)
                            }
                        }
            
                        
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
