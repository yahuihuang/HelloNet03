//
//  APIModel.swift
//  HelloNet03
//
//  Created by grace on 2019/12/7.
//  Copyright © 2019 grace. All rights reserved.
//

import UIKit
import Alamofire

class APIModel {
    static var share = APIModel()
    private var apiURL = "https://randomuser.me/api/"
    private init() {}   //只有api model可以呼叫他，強制用apimodel用share
    
//    func queryRandomUserAlamofire(completion: @escaping(_ Data:Any?._ respError: Error?)->()) {
//        let url = apiURL
//        let parameters:Parameters? = nil
//        DispatchQueue.global().async {
//            Alamofire.request(url,
//                              method: .get,
//                              parameters: nil,
//                              encoding: URLEncoding.,
//                              headers: <#T##HTTPHeaders?#>)
//        }
//    }
}
