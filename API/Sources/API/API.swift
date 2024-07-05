// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class API {
    static public var shared = API()
    let imgurURL = "https://api.imgur.com/"
    let searchGallery = "3/gallery/"
    let endGallery = "/0.json"

    public func getMostViralPosts(completion: @escaping ((Data?) -> Void)){
        let url =  buildURL("viral", "hot")
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

    public func getPosts(filterType: String? = nil, sorting: String? = nil, completion: @escaping ((Data?) -> Void)){
        let url = buildURL(filterType, sorting)
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

    private func buildURL(_ filterType: String? = nil, _ sorting: String? = nil) -> String {
        var url = imgurURL + searchGallery
        if let sorting {
            url = url + sorting + "/"
        }

        if let filterType {
            url = url + filterType
        }

        return url + endGallery
    }
}
