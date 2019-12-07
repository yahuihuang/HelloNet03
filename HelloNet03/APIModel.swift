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
//    private var apiURL = "https://randomuser.me/"
    private init() {}   //只有api model可以呼叫他，強制用apimodel用share
    
    func queryRandomUserAlamofire(_ apiURL:String, completion: @escaping(_ Data:Any?,_ respError: Error?)->())->() {
        let url = apiURL + "api/"
        let parameters:Parameters? = nil
//        let parameters:Parameters? = ["name": "danny", "kind": 1]
        DispatchQueue.global().async {
            let request = Alamofire.request(url,
                              method: .get,
                              parameters: parameters,
                              encoding: URLEncoding.default,
                              headers: nil)
            request.responseJSON(completionHandler: {(response) in DispatchQueue.main.async(
                                    execute: {
                                        switch response.result {
                                        case .success(_):
                                            return completion(response.data, nil)
                                        case .failure(let error):
                                            return completion(nil, error)
                                        }
                                    }
                                )
                    
                })
        }
    }
}
