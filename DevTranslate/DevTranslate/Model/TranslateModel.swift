//
//  TranslateModel.swift
//  DevTranslate
//
//  Created by Dante Clark on 3/24/20.
//  Copyright © 2020 devproj. All rights reserved.
//

import Foundation

struct TranslateModel: Decodable {
    let data: Translations
}

struct Translations: Decodable {
    let translations: [TranslatedText]
}

struct TranslatedText: Decodable {
    let translatedText: String
}

