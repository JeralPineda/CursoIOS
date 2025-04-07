//
//  IMCView.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 23/5/25.
//

import SwiftUI

struct IMCView: View {
    //Sobreescribir el color del titulo de la view
    //    init() {
    //        UINavigationBar.appearance().titleTextAttributes = [
    //            .foregroundColor: UIColor.white
    //        ]
    //    }

    @State var gender: Int = 0

    var body: some View {
        VStack {
            HStack {
                ToggleButton(
                    text: "Hombre",
                    imageName: "heart.fill",
                    gender: 0 ,
                    selectedGender: $gender
                )
                ToggleButton(
                    text: "Mujer",
                    imageName: "star.fill",
                    gender: 1,
                    selectedGender: $gender
                )
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)  //Ocupata todo el ancho y alto del view
        .background(.backgroundApp)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator")
                    .bold()
                    .foregroundColor(.white)
            }
        }
        //        .navigationTitle("IMC Calculator") //Se sobreescribe para modificar el color
    }
}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int

    //Se pasa el estado (binding), comunicarse con el padre
    @Binding var selectedGender: Int

    var body: some View {

        let color =
            if gender == selectedGender {
                Color.hoverApp
            } else {
                Color.foregroundApp
            }

        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)

                InformationText(text: text)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)

        }
    }
}

struct InformationText: View {
    let text: String

    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

#Preview {
    IMCView()
}
