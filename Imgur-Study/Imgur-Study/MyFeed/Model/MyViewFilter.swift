//
//  MyViewFilter.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 05/07/24.
//

import Foundation

enum MyViewFilterType: String {
    case MostViral = "viral"
    case UserSub = "time"
    case Trending = "top"
    case ForYou = "rising"
}

enum MyViewFilterSorting: String {
    case Popular = "hot"
    case Newest = "top"
    case Random = "user"
}
