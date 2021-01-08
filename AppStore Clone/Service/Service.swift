//
//  Service.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 29.12.2020.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
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
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> ()){
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error{
                return completion(nil, err)
            }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                completion(appGroup, nil)
            
            }
            catch{
                completion(nil, error)
                print("Failed to fetch AppGroup data")
            }
            
        }.resume()
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error{
                return completion(nil, err)
            }
            
            do {
                let objects = try JSONDecoder().decode([SocialApp].self, from: data!)
                completion(objects, nil)
            }
            catch{
                completion(nil, error)
                print("Failed to fetch AppGroup data")
            }
            
        }.resume()
    }
}
