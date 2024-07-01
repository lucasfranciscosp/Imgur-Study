// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

class API {
    static var shared = API()

    let imgurURL = "https://api.imgur.com/"

    func getMostViral(completion: @escaping (([Data]?) -> Void)){
        let url = imgurURL + "3/gallery/hot/time/day/1"
        var urlRequest:URLRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Client-ID 705d1626bf00932", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest){data,response,error in
            print(response as Any)
            if let data = data {
               do {
//                    let memesList:MemeList = try JSONDecoder().decode(MemeList.self, from: data)
//                    print(memesList.data.first?.title as Any)
//                    completion(memesList)
               } catch let error {
                  print(error)
               }
            }
            
        }
        task.resume()
    }
}
