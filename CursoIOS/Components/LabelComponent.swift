//
//  LabelComponent.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 23/5/25.
//

import SwiftUI

struct LabelComponent: View {
    var body: some View {
        Label(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/, image: "swiftui")
        
        Label("Jeral", systemImage: "person.circle")
        
        Label(title: {
            Text("Label")
        }, icon: {
            Image("swiftui")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
        })
    }
}

#Preview {
    LabelComponent()
}
