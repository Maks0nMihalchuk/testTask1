//
//  News.swift
//  testTask
//
//  Created by maks on 09.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import Foundation

//MARK: - HTML ссылки
struct AllUrlNews: Codable {
    var results: [NewsUrl]
}

struct NewsUrl: Codable  {
    var url: String
}

//MARK: - Название статей
struct AllTitlesNews: Codable {
    var results: [NewsTitles]
}

struct NewsTitles: Codable {
    var title: String
}
