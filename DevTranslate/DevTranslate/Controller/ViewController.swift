//
//  ViewController.swift
//  DevTranslate
//
//  Created by Dante Clark on 3/23/20.
//  Copyright © 2020 devproj. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController, LanguagesDelegate {
    
    @IBOutlet weak var languageTableView: UITableView!
    
    var languagesNetworkRequest = LanguagesNetworkRequest()
    
    var languagesModel: [LanguagesModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.languageTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        languageTableView.dataSource = self
        languageTableView.delegate = self
        languagesNetworkRequest.delegate = self
        
        
        languagesNetworkRequest.response()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.languageCell, for: indexPath)
        cell.textLabel?.text = languagesModel[indexPath.row].data.languages[indexPath.row].language
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = languagesModel[indexPath.row].data.languages[indexPath.row].language
        tableView.deselectRow(at: indexPath, animated: true)
        if let translatedVC = storyboard?.instantiateViewController(identifier: K.vcIdentifier) as? TranslateTextViewController {
            translatedVC.language = selectedRow
            navigationController?.pushViewController(translatedVC, animated: true)
        }
    }
}
