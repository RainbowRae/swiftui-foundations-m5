//
//  ContentModel.swift
//  MyLearning App
//
//  Created by Ian Bateman on 31/08/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // Current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    // MARK: - Data Methods
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the JSON into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // assign parsed modules to modules property
            self.modules = modules
        
        }
        catch {
            // To log error
            print("Could not pasre local data")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        }
        catch {
            // To log error
            print("Could not parse style data")
        }
        
    }
    
    // MARK: - Module naviation methods
    
    func beginModule(_ moduleid: Int) {
        
        // Find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
        
    }
    
    // MARK: Lesson navigation methods
    
    func beginLesson(_ lessonid: Int) {
        
        // Check that the lesson index is within range of module lessons
        if lessonid < currentModule!.content.lessons.count {
            currentLessonIndex = lessonid
        }
        else {
            currentLessonIndex = 0
        }
        
        // Set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func hasNextLessson() -> Bool {
        
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
        
    }
    
    func nextLesson() {
        
        // Advance to next lesson
        currentLessonIndex += 1
        
        // Check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            // Set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]

        }
        else {
            // Reset the lesson state
            currentLessonIndex = 0
            currentLesson = nil
            
        }
        
    }
    
}
