//
//  SubjectDetailView.swift
//  GPAthingy
//
//  Created by rgs on 16/11/21.
//

import SwiftUI

struct SubjectDetailView: View {
    
    var assessment: Assessment
    
    var body: some View {
        Text(assessment.name)
    }
}

struct SubjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetailView(assessment: Assessment(name: "Assessment 1"))
    }
}
