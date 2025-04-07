//
//  CounterState.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 23/5/25.
//

import SwiftUI

struct CounterState: View {
    // @State para comvertirlo en un estado
    @State var count: Int = 0
    
    var body: some View {
        Button(
            action: {
                count += 1
            },
            label: {
                Text("Contador: \(count)")
                    .bold()
                    .font(.title)
                    .frame(height: 50)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        )
    }
}

#Preview {
    CounterState()
}
