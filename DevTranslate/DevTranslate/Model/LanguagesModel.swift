//
//  TranslateModel.swift
//  DevTranslate
//
//  Created by Dante Clark on 3/23/20.
//  Copyright © 2020 devproj. All rights reserved.
//

import Foundation

struct LanguagesModel: Decodable {
    let data: LanguagesData
}

struct LanguagesData: Decodable {
    let languages: [Languages]
}

struct Languages: Decodable {
    let language: String
}
