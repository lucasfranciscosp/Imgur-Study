//
//  MostViralModel.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 27/06/24.
//

import Foundation
import API

struct MostViralModel: Codable {
    var title: String?
    var id: String?
    var ups: Int?
    var downs: Int?
    var comment_count:Int?
    var images:[ImageViral]?
    var views: Int?
    var points: Int?
    var datetime: Int? //epoch time
    var account_url: String?
}

struct ImageViral: Codable {
    var id: String?
    var type: String?
    var width: Int?
    var height: Int?
    var views: Int?
    var link: String?
    var animated: Bool?
}

struct MostViralList: Codable {
    var data:[MostViralModel]
}

