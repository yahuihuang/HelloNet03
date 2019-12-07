//
//  ViewController.swift
//  HelloNet03
//
//  Created by grace on 2019/12/7.
//  Copyright © 2019 grace. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var personImage: UIImageView!
    //    struct User {
//        var first_name:String
//        var last_name:String
//        var country:String
//    }
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUser()
    }

    func setData(_ json:JSON) {
        print(json)
        print(json["results"].count)
        for user in json["results"].arrayValue {
            print("姓名: \(user["login"]["username"].stringValue)")
            print("圖片: \(user["picture"]["thumbnail"].stringValue)")
            
            let headerlink = user["picture"]["thumbnail"].stringValue
            personImage.kf.setImage(with: URL(string: headerlink))
            
            let dataString:String = "username: \(user["login"]["username"].stringValue)\nthumbnail: \(user["picture"]["thumbnail"].stringValue)\n"
            textView.text = dataString
            
            print(user["login"].count)
            textView.text += "\n登入資訊\n"
            for loginData in user["login"] {
                print("loginData : \(loginData)")
                textView.text += "loginData : \(loginData)\n"
            }
            
        }
    }
    
    func updateUser() {
                let apiURL = "https://randomuser.me/"
                APIModel.share.queryRandomUserAlamofire(apiURL, completion: {(resData, error) in
                    if error != nil {
                        print("error!")
                    }
                    
                    do {
                        if let data = resData as? Data {
                            let json = try JSON(data: data)
                            self.setData(json)
//                            print(json)
//                            print(json["results"].count)
//                            for user in json["results"].arrayValue {
//                                print("username: \(user["login"]["username"].stringValue)")
//                                print("thumbnail: \(user["picture"]["thumbnail"].stringValue)")
//
//                                print(user["login"].count)
//                                for loginData in user["login"] {
//                                    print("loginData : \(loginData)")
//                                }
//
//                            }
                        }
                    } catch {
                        print("API Error!")
                    }
                })
    }
    
    @IBAction func updateUserAction(_ sender: UIButton) {
        self.updateUser()
    }
}

