//
//  SignUpViewController.swift
//  EassyCarpooler
//
//  Created by Adama Traore on 3/21/15.
//  Copyright (c) 2015 Adama Traore. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtphone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupTapped(sender: UIButton) {
        if (countElements(txtFullName.text) == 0){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Name field cannot be empty.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else if (countElements(txtEmail.text) == 0){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Email address field cannot be empty.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else if(!isValidEmail(txtEmail.text, strict: false)){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Please enter a valid email address.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            
        }else if (countElements(txtpassword.text) == 0){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Password field cannot be empty.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else if(!isValidPassword(txtpassword.text, regex: "^[a-zA-Z]\\w{3,14}$")){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Please enter a valid password.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else if (countElements(txtphone.text) == 0){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Phone number field cannot be empty.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }else if (!isValidPhone(txtphone.text)){
            var alert: UIAlertView = UIAlertView(title:"Oops!", message: "Please enter a valid phone number.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
        else{
            //TODO: All email/password/name/phone fields are now valid, we need to register the user
            //Check if user exists in db - if email and/or phone number exists
            var alert: UIAlertView = UIAlertView(title:"User Registration!!", message: "User successfully registered.", delegate: nil, cancelButtonTitle: "OK")
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
    
    func isValidPhone(text: String) -> Bool {
        return isTextEqualTo(10, text: text)
    }
    
    func isTextEqualTo(length: Int, text: String) -> Bool {
        return text.utf16Count == length
    }
    
    @IBAction func gotoLogin(sender: AnyObject) {
        [self.dismissViewControllerAnimated(true, completion: nil)];
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
