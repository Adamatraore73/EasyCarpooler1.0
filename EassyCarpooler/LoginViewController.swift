//
//  LoginViewController.swift
//  EassyCarpooler
//
//  Created by Adama Traore on 3/21/15.
//  Copyright (c) 2015 Adama Traore. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinTapped(sender: UIButton) {
        if (countElements(txtEmail.text) == 0){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Email address field cannot be empty.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else if(!isValidEmail(txtEmail.text, strict: false)){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Please enter a valid email address.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()

        }else if(countElements(txtPassword.text) == 0){
            var alert: UIAlertView = UIAlertView(title: "Oops!", message: "Password field cannot be empty.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else if(!isValidPassword(txtPassword.text, regex: "^[a-zA-Z]\\w{3,14}$")){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Please enter a valid password.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
        else{
            //TODO: All email/password fields are now valid, we need to log the user in
            //Check if user exists in db - if email and pwd combination is correct
            var alert: UIAlertView = UIAlertView(title:"User Login!!", message: "User successfully logged in.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
    
    }
    
    func isValidEmail(text: String, strict:Bool._ObjectiveCType?) -> Bool {
        var useStrict = (strict != nil) ? strict : false
        
        let emailRegex = (useStrict != nil) ? "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}" : ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let email = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        let result =  email?.evaluateWithObject(text)
        return result!
    }
    
    func isValidPassword(text: String, regex: String) -> Bool {
        let password = NSPredicate(format:"SELF MATCHES %@", regex)
        let result =  password?.evaluateWithObject(text)
        return result!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
