//
//  SuperheroSearcher.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 26/5/25.
//

import SDWebImageSwiftUI
import SwiftUI

struct SuperheroSearcher: View {
    @State var superHeroName: String = ""
    @State var superHeroes: ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false

    var body: some View {
        VStack {

            TextField(
                "",
                text: $superHeroName,
                prompt: Text("Search...")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding(16)
            .border(.purple, width: 1.5)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                //permite ejecutar procesos asyncronos en swift ui
                loading = true

                Task {
                    do {
                        superHeroes = try await ApiNetwork().getHeroesByQuery(
                            query: superHeroName
                        )
                    } catch {
                        print(error)
                    }

                    loading = false
                }

            }

            if loading {
                ProgressView().tint(.white)
            }

            NavigationStack {
                List(superHeroes?.results ?? []) { superhero in
                    ZStack {
                        SuperHeroItem(superhero: superhero)
                        NavigationLink(
                            destination: SuperHeroDetail(id: superhero.id)
                        ) {
                            EmptyView()
                        }.opacity(0)
                    }
                    .listRowBackground(
                        Color.backgroundApp
                    )
                }.listStyle(.plain)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

struct SuperHeroItem: View {
    let superhero: ApiNetwork.Superhero

    var body: some View {
        ZStack {
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)

            VStack {
                Spacer()
                Text(superhero.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)  //que el texto ocupe todo el ancho
                    .background(.white.opacity(0.5))
            }
        }
        .frame(height: 200).cornerRadius(32)
    }
}

#Preview {
    SuperheroSearcher()
}
