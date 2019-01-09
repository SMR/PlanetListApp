//
//  Servise.swift
//  PlanetListApp
//
//  Created by iSparshiT on 09/01/19.
//  Copyright © 2019 Samarjeet. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    //MARK: -  NSURLSession DataTask - Get Method
    func fetchPlanets(completion: @escaping (PlanetModel?, Error?) -> ()) {
        let urlString = "https://swapi.co/api/planets"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let planets = try JSONDecoder().decode(PlanetModel.self, from: data)
                
                DispatchQueue.main.async {
                    completion(planets, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
    
    //MARK: - Generic Method for NSURLSession DataTask - Get Method
     func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {

        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch data:", err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            }.resume()
    }
    

}
