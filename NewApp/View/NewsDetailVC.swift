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
        webView.navigationDelegate = self
        guard let link = URL(string: newsUrl) else { return }
        let request = URLRequest(url: link)
        webView.load(request)
    }

}

//MARK: - Webview Functions
extension NewsDetailVC: WKNavigationDelegate{
    // didStartProvisionalNavigation
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showLoader()
        print("WebviewdidStartLoading")
    }
    
    // didFinish
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebviewdidFinishLoading")
        removeLoader()
    }
}
