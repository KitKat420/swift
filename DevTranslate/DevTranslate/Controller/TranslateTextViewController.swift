//
//  TranslateTextViewController.swift
//  DevTranslate
//
//  Created by Dante Clark on 3/25/20.
//  Copyright © 2020 devproj. All rights reserved.
//

import UIKit

class TranslateTextViewController: UIViewController {
    
    @IBOutlet weak var queryTextField: UITextField!
    
    var translationNetworkRequest = TranslationNetworkRequest()
        
    @IBOutlet weak var sourceTextField: UITextField!
    @IBOutlet weak var translationLabel: UILabel!
    
    var language = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        translationNetworkRequest.delegate = self
    }
    @IBAction func someButton(_ sender: UIButton) {
        translationNetworkRequest.query(target: language, q: sourceTextField.text!)
    }
}

extension TranslateTextViewController: TranslationDelegate {
    func retrieved(_ translation: TranslateManager) {
        DispatchQueue.main.async {
            self.translationLabel.text = translation.text
        }
    }
}
