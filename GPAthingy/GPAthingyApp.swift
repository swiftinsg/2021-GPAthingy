//
//  GPAthingyApp.swift
//  GPAthingy
//
//  Created by cpyoufy on 15/11/21.
//

import SwiftUI

struct GPAthingyApp: App {
    
    @ObservedObject var assessmentsData = AssessmentsData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(assessments: $assessmentsData.assessments)
                .onAppear {
                    assessmentsData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        assessmentsData.save()
                    }
                }
        }
    }
}
