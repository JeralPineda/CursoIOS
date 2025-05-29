//
//  SuperHeroDetail.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 27/5/25.
//

import SDWebImageSwiftUI
import SwiftUI

struct SuperHeroDetail: View {
    let id: String

    @State var superhero: ApiNetwork.SuperheroCompleted? = nil
    @State var loading: Bool = true

    var body: some View {
        VStack {

            if loading {
                ProgressView().tint(.white)
            } else if let superhero = superhero {
                //con esa linea se evita validacion superhero?
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()

                Text(superhero.name)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                ForEach(superhero.biography.aliases, id: \.self) { alias in
                    Text(alias).foregroundColor(.gray).italic()
                }

                Spacer()

            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .onAppear {
            //Cuando la vista aparezca realizar la peticion a la API

            Task {
                do {
                    superhero = try await ApiNetwork().getHeroById(id: id)
                } catch {
                    superhero = nil
                    print(
                        "❌ Error al cargar el héroe: \(error.localizedDescription)"
                    )
                }
                loading = false
            }

        }
    }

}

#Preview {
    SuperHeroDetail(id: "2")
}
