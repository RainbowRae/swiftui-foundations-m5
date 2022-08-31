//
//  MyLearning_AppApp.swift
//  MyLearning App
//
//  Created by Ian Bateman on 31/08/2022.
//

import SwiftUI

@main
struct MyLearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
