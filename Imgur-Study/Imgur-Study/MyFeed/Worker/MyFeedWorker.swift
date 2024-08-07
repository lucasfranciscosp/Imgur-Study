//
//  MostViralWorker.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 01/07/24.
//

import Foundation
import API
import SwiftUI

class MyFeedWorker {
    static func getMostViralModelList(completion: @escaping ((MyFeedList?) -> (Void))) {
        API.shared.getMostViralPosts(completion: { data in
            do {
                if let data = data {
                    let mostViralList: MyFeedList = try JSONDecoder().decode(MyFeedList.self, from: data)
                    completion(mostViralList)
                }
            } catch let error {
               print(error)
            }
        })
    }

    static func getPostList(filterType: MyViewFilterType , sorting: MyViewFilterSorting, completion: @escaping ((MyFeedList?) -> (Void))) {
        API.shared.getPosts(filterType: filterType.rawValue, sorting: sorting.rawValue) { data in
            do {
                if let data = data {
                    let mostViralList: MyFeedList = try JSONDecoder().decode(MyFeedList.self, from: data)
                    completion(mostViralList)
                }
            } catch let error {
               print(error)
            }
        }
    }
}
