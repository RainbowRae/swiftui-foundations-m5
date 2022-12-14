//
//  ContentView.swift
//  MyLearning App
//
//  Created by Ian Bateman on 04/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) { index in
                        
                        NavigationLink(destination: ContentDetailView()
                            .onAppear(perform: {
                                model.beginLesson(index)
                            }),
                                label: {ContentViewRow(index: index)})
                    
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}


