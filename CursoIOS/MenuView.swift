//
//  MenuView.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 23/5/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {

            NavigationLink(destination: IMCView()) {
                Text("IMC Calculator")
            }

            VStack {
                Text("App 2")
                Text("App 3")
            }
        }
    }
}

#Preview {
    MenuView()
}
