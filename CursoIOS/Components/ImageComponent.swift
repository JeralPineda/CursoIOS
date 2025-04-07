//
//  ImageComponent.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 23/5/25.
//

import SwiftUI

struct ImageComponent: View {
    var body: some View {
        Image("swiftui")
            .resizable()
//            .scaledToFill()
            .scaledToFit() //Se adapta
            .frame(width: 50, height: 90)
        
        Image(systemName: "figure.walk")
            .resizable()
    }
}

#Preview {
    ImageComponent()
}
