//
//  MostViralWorker.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 01/07/24.
//

import Foundation
import API

class MyFeedWorker {
    static func getMostViralModelList(completion: @escaping ((MostViralList?) -> (Void))) {
        API.shared.getMostViral(completion: { data in
            do {
                if let data = data {
                    let mostViralList: MostViralList = try JSONDecoder().decode(MostViralList.self, from: data)
                    completion(mostViralList)
                }
            } catch let error {
               print(error)
            }
        })
    }
}
