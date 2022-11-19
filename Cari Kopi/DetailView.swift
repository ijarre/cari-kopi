//
//  DetailView.swift
//  Cari Kopi
//
//  Created by Faizhar Riskisyah on 19/11/22.
//

import SwiftUI

struct DetailView: View {
    let coffeeDetail: Coffeeshop
    var body: some View {
        ZStack{
            LinearGradient(colors: [.indigo, .white], startPoint: .bottomTrailing, endPoint: .topLeading).ignoresSafeArea()
            VStack(spacing:20){
                
                    Image("\(coffeeDetail.image)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height:200)
                        .clipShape(Circle())
                        .overlay{
                            ZStack{
                                Circle().opacity(0.6)
                                VStack{
                                    Image(systemName: "person.2.fill").foregroundColor(.white)
                                        .font(.title)
                                    Text("\(coffeeDetail.name)")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        
                
                Text("\(coffeeDetail.review)")
                    .multilineTextAlignment(.center)

                    .foregroundColor(.black)
                HStack{
                    
                    Image(systemName: "mappin.circle.fill").foregroundColor(.white)
                Text("\(coffeeDetail.location)").font(.callout).fontWeight(.bold)
                    .foregroundColor(.white)
                }
                
            }.padding(20)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coffeeDetail:  Coffeeshop(image: "bojaeatery", name: "Boja Eatery", location: "Jl. Sumatera No. 21, Kota Bandung", review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class"))
    }
}
