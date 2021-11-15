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
    var listArr: Box<[Article]> { get set }
    func fetchNewsList()
}

struct NewsListViewModel: NewsListDelegate {
    var success: Box<Bool> = Box(Bool())
    var listArr: Box<[Article]> = Box([Article]())
    
    func fetchNewsList() {
        DispatchQueue.global().async {
            APIManager.sharedInstance.I_AM_COOL_GET(params: [String : Any](), api: API.BASE_URL, Loader: true, isMultipart: false) { (response) in
                if response != nil{                      //if response is not empty
                    do {
                        let success = try JSONDecoder().decode(NewsListResponse.self, from: response!) // decode the response into model
                        switch success.status{
                        case "ok":
                            self.listArr.value = success.articles
                            self.success.value = true
                            break
                        default:
                            log.error("\(Log.stats()) \(success.status)")/
                        }
                    }
                    catch let err {
                        log.error("ERROR OCCURED WHILE DECODING: \(Log.stats()) \(err)")/
                    }
                }
            }
        }
    }
}
