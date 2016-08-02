//
//  ViewController.swift
//  archifeeld-ios
//
//  Created by LLEEJONG on 2016. 7. 29..
//  Copyright © 2016년 archifeeld. All rights reserved.
//

import UIKit

/**
 Facebook Login 참고링크 : http://www.brianjcoleman.com/tutorial-how-to-use-login-in-facebook-sdk-4-0-for-swift/
 */

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:: 페이스북 로그인 혹은 아키필드 전용 계정으로 로그인 하는 경우로 케이스 나누기
        
        if(FBSDKAccessToken.currentAccessToken() != nil){
            //이미 토큰을 받은 경우,
            //var currentAccessToken = FBSDKAccessToken.currentAccessToken()
            
            print("Current Token is already existed.")
            
        }
        else{
            //로그인을 아직 하지 않은 경우,
            fbLoginButton.loginBehavior = FBSDKLoginBehavior.Native
            fbLoginButton.readPermissions = ["public_profile", "email","user_friends"]
            fbLoginButton.delegate = self
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Facebook Delegate Methods
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
        print("User Logged In")
        
        if((error) != nil){
            //Process Error
            print(error.localizedDescription)
        }
        else if result.isCancelled {
            //Handle cancellations
        }
        else {
            //if result.grantedPermissions.contains("email"){
            //    returnUserData()
            //}
            print(result.grantedPermissions)
            returnUserData()
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
        print("User Logged Out")
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        
    }
    
    func returnUserData(){
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"])
        graphRequest.startWithCompletionHandler(
            { (connection, result, error) -> Void in
                
                if((error) != nil){
                    //Process Error
                    print("Error: \(error)")
                }
                else{
                    print("fetched user: \(result)")
                    let userName : NSString = result.valueForKey("name") as! NSString
                    print("User Name: \(userName)")
                    let userEmail : NSString = result.valueForKey("email") as! NSString
                    print("User Email is: \(userEmail)")
                    
                }
                
        })
    }
    
    
}

