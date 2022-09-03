//
//  ContentView.swift
//  MyLearning App
//
//  Created by Ian Bateman on 31/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            VStack (spacing: 20){
                                // Learning Card
                                HomeViewRow(cardImage: module.content.image, cardTitle: "Learn \(module.category)", cardDescription: module.content.description, cardCount: "\(module.content.lessons.count) lessons", cardTime: module.content.time)
                                
                                // Test Card
                                HomeViewRow(cardImage: module.test.image, cardTitle: "\(module.category) Test", cardDescription: module.test.description, cardCount: "\(module.test.questions.count) questions", cardTime: module.test.time)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Get Started")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
