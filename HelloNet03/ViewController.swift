//
//  ViewController.swift
//  HelloNet03
//
//  Created by grace on 2019/12/7.
//  Copyright © 2019 grace. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let apiURL = "https://randomuser.me/"
        APIModel.share.queryRandomUserAlamofire(apiURL, completion: {(resData, error) in
            if error != nil {
                print("error!")
            }
            
            do {
                if let data = resData as? Data {
                    let json = try JSON(data: data)
                    print(json)
                    print("username: \(json["results"][0]["login"]["username"].stringValue)")
                    print("username: \(json["results"][0]["picture"]["thumbnail"].stringValue)")
                }
            } catch {
                print("API Error!")
            }
        })
    }


}

