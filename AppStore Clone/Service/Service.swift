//
//  Service.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 29.12.2020.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        print("fetching stuff right now")
        
        let urlString = "https://itunes.apple.com/search?term=turkmen&entity=software"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err{
                print("failed to fetch apps", err)
                completion([], err)
                return
            }

            guard let data = data else {return}

            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            }
            catch let JSONerror{
                completion([], JSONerror)
            }

        }.resume()
        
    }
}
