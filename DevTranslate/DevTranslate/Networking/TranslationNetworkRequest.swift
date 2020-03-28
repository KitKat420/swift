//
//  TranslationNetworkRequest.swift
//  DevTranslate
//
//  Created by Dante Clark on 3/24/20.
//  Copyright © 2020 devproj. All rights reserved.
//

import Foundation
import Combine

protocol TranslationDelegate {
    func retrieved(_ translation: TranslateManager)
}

class TranslationNetworkRequest {
    
    var cancellable: AnyCancellable?
    
    var delegate: TranslationDelegate?
    
    func query(target: String, q: String) {
        var languageOutput = ""
        let urlString = "https://translation.googleapis.com/language/translate/v2?q=\(q.replacingOccurrences(of: " ", with: "%20"))&source=en&target=\(target)&format=text&key=AIzaSyBvZkKn248-IXfIHye_79ACprMg1rpYW_0"
        
        if let url = URL(string: urlString) {
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: TranslateModel.self, decoder: JSONDecoder())
                .sink(receiveCompletion: { (completion) in
                    switch completion {
                    case .failure(let error): print(error.localizedDescription)
                    case .finished: print("OK!")
                    }
                    
                } , receiveValue: {(value) in
                    print(q)
                    languageOutput = value.data.translations[0].translatedText
                    print(languageOutput)
                    
                    self.delegate?.retrieved(TranslateManager(text: languageOutput))
                    
                    print(q.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
                })
        }
    }
}
