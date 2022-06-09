//
//  WebkitViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 05.05.2022.
//

import UIKit
import WebKit

class WebkitViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchTextField: UITextField!
    
    let urlString = "https://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.text = urlString
        searchButtonAction(nil)
    }
    

    @IBAction func searchButtonAction(_ sender: Any?) {
        
        //Строка из textField
        let searchString =  searchTextField.text
        
        //Структура URL
        guard let url = URL(string: searchString ?? "") else { return }
        
        //Структура HTTP запроса
        let urlRequest = URLRequest(url: url)
        
        webView.load(urlRequest)
    }
    

}
