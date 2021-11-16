//
//  ActualSubjectDetailView.swift
//  GPAthingy
//
//  Created by rgs on 16/11/21.
//

import SwiftUI

struct ActualSubjectDetailView: View {
    var subject: Subject
    
    var body: some View {
        VStack {
            Text(subject.name)
            Text("\(subject.score)")
        }
    }
}

struct ActualSubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActualSubjectDetailView(subject: Subject(name: "Math",
                    score: 90))
    }
}
