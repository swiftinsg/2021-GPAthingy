//
//  ActualSubjectDetailView.swift
//  GPAthingy
//
//  Created by rgs on 16/11/21.
//

import SwiftUI

struct ActualSubjectDetailView: View {
    @Binding var subject: Subject
    
    var body: some View {
        VStack {
            Text(subject.name)
            Text("\(Int(subject.score))%")
        }
    }
}

struct ActualSubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActualSubjectDetailView(subject: .constant(Subject(name: "Math",
                    score: 90)))
    }
}
