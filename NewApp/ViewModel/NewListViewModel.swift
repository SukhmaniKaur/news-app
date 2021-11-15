//
//  NewListViewModel.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import Foundation
import SainiUtils

protocol NewsListDelegate {
    var success: Box<Bool> { get set }
    func fetchNewsList()
}

struct NewsListViewModel: NewsListDelegate {
    var success: Box<Bool> = Box(Bool())
    
    func fetchNewsList() {
        DispatchQueue.global().async {
            APIManager.sharedInstance.I_AM_COOL_GET(params: [String : Any](), api: API.BASE_URL, Loader: true, isMultipart: false) { (response) in
                print(response)
            }
        }
    }
}
