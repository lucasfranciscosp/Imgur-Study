// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class API {
    static public var shared = API()
    let imgurURL = "https://api.imgur.com/"

    public func getMostViral(completion: @escaping ((Data?) -> Void)){
        let url = imgurURL + "3/gallery/hot/viral/0.json"
        var urlRequest:URLRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Client-ID 7bc6c559d469760", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest){data,response,error in
            print(response as Any)
            if let data = data {
               do {
                    completion(data)
               } catch let error {
                  print(error)
               }
            }
            
        }
        task.resume()
    }
}
