//
//  ApiNetwork.swift
//  CursoIOS
//
//  Created by Jeral Pineda on 26/5/25.
//

import Foundation

class ApiNetwork {
    struct Wrapper: Codable {
        let response: String
        let results: [Superhero]
    }

    struct Superhero: Codable, Identifiable {
        let id: String
        let name: String
        let image: ImageSuperHero
    }

    struct ImageSuperHero: Codable {
        let url: String
    }

    struct SuperheroCompleted: Codable {
        let id: String
        let name: String
        let image: ImageSuperHero
        let powerstats: Powerstats
        let biography: Biography
    }

    struct Powerstats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }

    struct Biography: Codable {
        let alignment: String
        let publisher: String
        let aliases: [String]
        let fullName: String

        //Transformas key de la api a Swift (no acepta guiones
        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"

            //Hay que agregar los demas obligatoriamente aunque sean iguales
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }

    func getHeroesByQuery(query: String) async throws -> Wrapper {
        let url = URL(
            string:
                "https://superheroapi.com/api/dd9c044493e0a6f8381262f239d14a66/search/\(query)"
        )!

        //Peticion
        let (data, _) = try await URLSession.shared.data(from: url)

        //Parsear la data a nuestro modelo (typo de datos)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)

        return wrapper
    }

    func getHeroById(id: String) async throws -> SuperheroCompleted {
        let url = URL(
            string:
                "https://superheroapi.com/api/dd9c044493e0a6f8381262f239d14a66/\(id)"
        )!

        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(SuperheroCompleted.self, from: data)

    }
}
