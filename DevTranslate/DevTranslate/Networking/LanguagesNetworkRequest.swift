//
//  TranslateNetworkRequest.swift
//  DevTranslate
//
//  Created by Dante Clark on 3/24/20.
//  Copyright © 2020 devproj. All rights reserved.
//

import Foundation
import Combine

protocol LanguagesDelegate {
    var languagesModel: [LanguagesModel] { get set }
}

class LanguagesNetworkRequest {
    var cancellable: AnyCancellable?
    
    var delegate: LanguagesDelegate?
    
    // list of language codes
    let urlString = "https://translation.googleapis.com/language/translate/v2/languages?key=AIzaSyBvZkKn248-IXfIHye_79ACprMg1rpYW_0"
    
    func response() {
        guard let url = URL(string: urlString) else { return }
        
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: LanguagesModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error): print(error)
                case .finished: print("no error")
                }
                
            }, receiveValue: { (value) in
                for _ in 1...value.data.languages.count {
                    self.delegate?.languagesModel.append(value)
                }
            })
    }
}
