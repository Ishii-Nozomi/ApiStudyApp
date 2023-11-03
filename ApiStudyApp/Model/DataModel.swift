//
//  DataModel.swift
//  ApiStudyApp
//
//  Created by NOZOMI ISHII on 2023/11/02.
//

import Foundation

struct QiitaStruct: Codable {
    var title: String
    var user: User
    struct User: Codable {
        var name: String
    }
}
