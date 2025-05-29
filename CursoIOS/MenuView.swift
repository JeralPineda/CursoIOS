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

            List {
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                }
                NavigationLink(destination: SuperheroSearcher()) {
                    Text("SuperheroSearcher")
                }
            }

        }
    }
}

#Preview {
    MenuView()
}
