//
//  HomeViewRow.swift
//  MyLearning App
//
//  Created by Ian Bateman on 03/09/2022.
//

import SwiftUI

struct HomeViewRow: View {
    
    var cardImage: String
    var cardTitle: String
    var cardDescription: String
    var cardCount: String
    var cardTime: String
    
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                
                // Image
                Image(cardImage)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                // Text
                VStack (alignment: .leading, spacing: 10) {
                    
                    //Headline
                    Text(cardTitle)
                        .bold()
                    
                    // Description
                    Text(cardDescription)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    // Icons
                    HStack {
                        
                        // Number of Lessons or Questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(cardCount)
                            .font(.system(size: 10))
                        
                        Spacer()
                        
                        // Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(cardTime)
                            .font(.system(size: 10))
                        
                        
                    }
                    
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
            
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(cardImage: "swift", cardTitle: "Learn Swift", cardDescription: "Swift description", cardCount: "10 Lessons", cardTime: "2 Hours")
    }
}
