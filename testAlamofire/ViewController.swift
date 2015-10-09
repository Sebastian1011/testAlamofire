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
    let name = "test1008"
    let email = "test1008@tingdao.me"
    let password = "123456"
    let password_confirmation = "123456"
    let newPassword = "246801"
    let dev = "iOS"
    let urlString = "http://www.tingdao.me:8390/auth/register"
    let loginUrl = "http://www.tingdao.me:8390/auth/login"
    let changpwdUrl = "http://www.tingdao.me:8390/api/changepwd"
    let logoutUrl = "http://www.tingdao.me:8390/auth/logout"
    let verifyPhoneUrl = "http://www.tingdao.me:8390/api/verifyphone"
    let previewUrl = "http://www.tingdao.me:8390/api/preview"
    let checkuserUrl = "http://www.tingdao.me:8390/api/checkuser"
    let savesrtUrl = "http://www.tingdao.me:8390/api/savesrt"
    let userphotoUrl = "http://www.tingdao.me:8390/api/userphoto"
    let userfileUrl = "http://www.tingdao.me:8390/api/userfile"
    let genfileUrl = "http://www.tingdao.me:8390/api/genfile"
    let recentfile = "http://www.tingdao.me:8390/api/recentfile"
    
    
    @IBOutlet weak var button: UIButton!

    var token:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        testAlamofire(urlString)
        // Do any additional setup after loading the view, typically from a nib.
        //testAlamofire()
        //resignPost()
        //example()
        //example1()
        //example2()
        //example3()
    }
    @IBAction func button(sender: AnyObject) {
        //example2Post(urlString)
        
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        loginPost(loginUrl)
        
    }
    
    @IBAction func logoutButton(sender: AnyObject) {
        logout(logoutUrl)
    }
    
    @IBAction func verifyPhone(sender: AnyObject) {
        verifyPhoneButton(verifyPhoneUrl)
    }
    
    @IBAction func previewButton(sender: AnyObject) {
        previewsButton(previewUrl)
    }
    
    @IBAction func checkuserButton(sender: AnyObject) {
        checkuser(checkuserUrl)
    }
    
    
    func testAlamofire(urlString:String){
        Alamofire.request(.GET, urlString)
            .responseString { response in
                self.token = response.result.value
                print(self.token)
        }
    }
    
    
    
    //login
    func loginPost(urlString: String){
        let parameter = [
            "_token":self.token,
            "email":self.email,
            "password":self.password
        ]
        Alamofire.request(.POST, urlString, parameters:parameter)
            .responseString { response in
                if response.result.isSuccess{
                    
                    print(response.result.value)
                }else{
                    print(response.result.error)
                }
                
        }
        
    }
    
    //logout
    func logout(urlString:String){
        Alamofire.request(.GET, urlString)
            .responseString{ response in
                if response.result.isSuccess{
                    print(response.result.value)
                }else{
                    print(response.result.error)
                }
        }
    }
    
    //verifyPhone
    func verifyPhoneButton(urlString:String){
        let parameter = [
            "phone": "15618564259"
        ]
        Alamofire.request(.POST, urlString, parameters:parameter)
            .responseString{ response in
                if  response.result.isSuccess{
                    print(response.result.value)
                }else{
                    print(response.result.error)
                }
                
        }
    }
    
    //change pass word
    func changePwd(urlString:String){
        let parameter = [
            "_token":self.token,
            "password":self.password,
            "new_password":self.newPassword
        ]
        Alamofire.request(.POST, urlString, parameters:parameter)
            .responseString{ response in
                if response.result.isSuccess{
                    print(response.result.value)
                }else {
                    print(response.result.value)
                }
    }
    }
    
    //user preview
    func previewsButton(urlString:String){
        let parameter = [
            "_token":self.token
        ]
        Alamofire.request(.POST, urlString, parameters:parameter)
            .responseJSON{ response in
                
                if response.result.isSuccess{
                    print(response.data)
                }else{
                    print(response.result.error)
                }
                
        }
    }
    
    //check user 
    func checkuser(urlString:String){
        
        Alamofire.request(.POST, urlString)
            .responseJSON{ response in
                
                if response.result.isSuccess{
                    print(response.result.value)
                }else{
                    print(response.result.error)
                }
                
        }
    }
    
    
    //Making a Request
    /*
    func example(){
        Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
            .response { request, response, data, error in
                print(request)
                print(response)
                print(error)
        }
    }
    */
    
    /*
    Response Serialization
    Built-in Response Methods
    
    response()
    responseString(encoding: NSStringEncoding)
    responseJSON(options: NSJSONReadingOptions)
    responsePropertyList(options: NSPropertyListReadOptions)
    */

    //RESPONSE STRING HANDLER
    /*
    func example1(){
        Alamofire.request(.GET, "http://httpbin.org/get")
            .responseString { _, _, result in
                print("Success: \(result.isSuccess)")
                print("Response String: \(result.value)")
        }
    }
    */
    
    //RESPONSE JSON HANDLER
    /*func example2(){
        
        Alamofire.request(.GET, "http://httpbin.org/get")
            .responseJSON { response in
                if response.result.isSuccess {
                    let jsonDic = response.result.value as! NSDictionary
                    print(jsonDic)
                    
                    //self.newsDataArray = responseData["results"] as! NSArray
                    //self.table.reloadData()
                }
        }
    }
    */

    func example2Post(urlString:String){
        let parameters = [
            "_token":self.token,
            "name":self.name,
            "email":self.email,
            "password":self.password,
            "password_confirmation":self.password_confirmation,
            "dev":self.dev
        ]
        Alamofire.request(.POST, urlString, parameters: parameters)
            .responseString{ response in
                if response.result.isSuccess{
                    let result = response.result.value
                    print(result)
                }
        }
    }
    
    //CHAINED RESPONSE HANDLERS
    /*
    func example3(){
        
        Alamofire.request(.GET, "http://httpbin.org/get")
            .responseString { _, _, result in
                print("Response String: \(result.value)")
                }
            .responseJSON { _, _, result in
                print("Response JSON: \(result.value)")
                }
    }
    */

    
    
    
    
    /*func resignPost(){
        let param = [
            "_token":self.token,
            "name":self.name,
            "email":self.email,
            "password":self.password,
            "password_confirmation":self.password_confirmation
        ]
        Alamofire.request(.POST, "http://httpbin.org/post", parameters: param, encoding: .JSON)
            .responseJSON { response in
                let success = response.result.value
                print(success)
        }
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

