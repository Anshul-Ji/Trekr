//
//  Locations.swift
//  Trekr
//
//  Created by Paul Hudson on 22/12/2020.
//

import Foundation

class Locations: ObservableObject {
    var places: [Location]

    var primary: Location {
        places[0]
    }
//
//    let urlString = "https://jsonkeeper.com/b/1QID"
//
//    func parse(jsonData: Data) {
//        places = try! JSONDecoder().decode([Location].self, from: jsonData)
//    }
//    func loadJson(fromURLString urlString: String,completion: @escaping (Result<Data, Error>) -> Void) {
//        if let url = URL(string: urlString) {
//            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
//                if let error = error {
//                    completion(.failure(error))
//                }
//
//                if let data = data {
//                    completion(.success(data))
//                }
//            }
//
//            urlSession.resume()
//        }
//    }

    init() {
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        places = try! JSONDecoder().decode([Location].self, from: data)
//        self.loadJson(fromURLString: urlString) { (result) in
//            switch result {
//            case .success(let data):
//                self.parse(jsonData: data as Data)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
