//
//  GPAthingyApp.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import SwiftUI

@main
struct GPAthingyApp: App {
    
    @ObservedObject var assessmentsData = AssessmentsData()
    @ObservedObject var subjectsData = SubjectsData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(assessments: $assessmentsData.assessments, subjects: $subjectsData.subjects)
                .onAppear {
                    assessmentsData.load()
                    subjectsData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        assessmentsData.save()
                        subjectsData.save()
                    }
                }
        }
    }
}
