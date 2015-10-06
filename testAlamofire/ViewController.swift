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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testAlamofire()
    }
    
    func testAlamofire(){
        Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
            .responseData { response in
                print(response.request)
                print(response.response)
                print(response.result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

