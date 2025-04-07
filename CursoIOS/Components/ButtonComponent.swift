//
//  ButtonComponent.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 23/5/25.
//

import SwiftUI

struct ButtonComponent: View {
    var body: some View {
        Button("Hola") {
            print("Hola")
        }

        //El mas completo
        Button(
            action: {
                print("Hola mundo")
            },
            label: {
                Text("Print")
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        )

    }
}

#Preview {
    ButtonComponent()
}
