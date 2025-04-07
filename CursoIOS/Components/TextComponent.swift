//
//  TextComponent.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 23/5/25.
//

import SwiftUI

struct TextComponent: View {
    var body: some View {
        VStack {
            Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/).font(.headline)
            
            Text("Custom").font(.system(size: 40, weight: .light, design: .monospaced))
                .italic()
                .bold()
                .underline()
                .foregroundColor(.blue)
                .background(.red)
            
            Text("Aris Aris Aris Aris Aris Aris Aris")
                .frame(width: 150)
                .lineLimit(3)
                .lineSpacing(10)
        }
    }
}

#Preview {
    TextComponent()
}
