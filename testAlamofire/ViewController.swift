//
//  ViewController.swift
//  testAlamofire
//
//  Created by 张子名 on 10/6/15.
//  Copyright © 2015 tingdao. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var token:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testAlamofire()
    }
    
    func testAlamofire(){
        Alamofire.request(.GET, "http://www.tingdao.me:8390/auth/login")
            .responseString { response in
                self.token = response.result.value
                print(self.token)
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

