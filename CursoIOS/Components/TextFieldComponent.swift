//
//  TextFieldComponent.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 23/5/25.
//

import SwiftUI

struct TextFieldComponent: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .frame(height: 50)
                .padding(10)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .onChange(of: email) {
                    oldValue,
                    newValue in
                    print("El email es: \(newValue)")
                }

            SecureField("Password", text: $password)
                .keyboardType(.emailAddress)
                .frame(height: 50)
                .padding(10)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 10)

        }

    }
}

#Preview {
    TextFieldComponent()
}
