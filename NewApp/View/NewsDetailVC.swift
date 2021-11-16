//
//  NewsDetailVC.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import UIKit
import WebKit

class NewsDetailVC: UIViewController {
    
    var newsUrl: String = String()

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - configUI
    private func configUI() {
        guard let link = URL(string: newsUrl) else { return }
        let request = URLRequest(url: link)
        webView.load(request)
    }
}
