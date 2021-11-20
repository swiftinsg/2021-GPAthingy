//
//  GPAthingyApp.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import SwiftUI

@main
struct GPAthingyApp: App {
    @ObservedObject var todoData = TodoData()
    @ObservedObject var assessmentsData = AssessmentsData()
    @ObservedObject var subjectsData = SubjectsData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(todos: $todoData.todos, assessments: $assessmentsData.assessments, subjects: $subjectsData.subjects)
                .onAppear {
                    todoData.load()
                    assessmentsData.load()
                    subjectsData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        todoData.save()
                        assessmentsData.save()
                        subjectsData.save()
                    }
                }
        }
    }
}

