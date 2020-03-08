//
//  NetworkingRequest.swift
//  testTask
//
//  Created by maks on 09.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import Foundation
import Alamofire

class Network {

    static var linksNews = AllUrlNews(results: [])
    static var titlesNews = AllTitlesNews(results: [])

    func newsRequest(compltion: (()->Void)) {
        //Запрос
        compltion()
    
    }
//MARK: - Parsing links of news
    class func newsParsing (categories: String, complition:  @escaping ()->()) {
                
            AF.request("https://api.nytimes.com/svc/topstories/v2/\(categories).json?api-key=a5iPve4IyBmGUNQ7hv3UwrQP2hdLYqEy").response { respose in
                    switch respose.result {
                    case .success(let value):
                        guard let data = value else {
                            return
                        }
                        do {
                            let dickURL = try JSONDecoder().decode(AllUrlNews.self, from: data)
                            Network.linksNews = dickURL
                            
                            DispatchQueue.main.async {
                                complition()
                            }
                            
                        }catch (let error){
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        print(error)
                    }
            }
    }
//MARK: - parsing article titles
    class func newsTitleParsing (categories: String, complition: @escaping ()->()) {
           
           AF.request("https://api.nytimes.com/svc/topstories/v2/\(categories).json?api-key=a5iPve4IyBmGUNQ7hv3UwrQP2hdLYqEy").response { respose in
               switch respose.result {
               case .success(let value):
                   guard let data = value else {
                       return
                   }
                   do {
                       let dickTitle = try JSONDecoder().decode(AllTitlesNews.self, from: data)
                       Network.titlesNews = dickTitle
                       
                       DispatchQueue.main.async {
                           complition()
                       }
                       
                   }catch (let error){
                       print(error.localizedDescription)
                   }
               case .failure(let error):
                   print(error)
               }
           }
    }
}
