//
//  musicModel.swift
//  phpRealm
//
//  Created by norikatano on 2022/05/26.
//

import Foundation

class MusicItem: Codable, Identifiable {
    var id: String? = ""
    var title: String? = ""
    var author: String? = ""
    var description: String? = ""
    var url: String? = ""
    var time: String? = ""
    var version: String? = ""
}

