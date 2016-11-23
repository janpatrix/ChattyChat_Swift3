//
//  AuthService.swift
//  ChattyChat
//
//  Created by Patrick Gross on 22/11/2016.
//  Copyright © 2016 Patrick Gross. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errorMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    
                    if errorCode == .errorCodeUserNotFound {
                        
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            
                            if error != nil {
                                //Show error to user
                                self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                
                            } else {
                                
                                if user?.uid != nil {
                                    //Sign in
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                    
                                        if error != nil {
                                            //Show error to user
                                            self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                            
                                        } else {
                                            //We have successfully logged in
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //Handle all other errors
                    self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                }
            } else {
                //We have successfully logged in
                onComplete?(nil, user)
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            
            switch (errorCode) {
                
            case .errorCodeInvalidEmail, .errorCodeAccountExistsWithDifferentCredential:
                
                onComplete?("Invalid email address", nil)
                break
                
            case .errorCodeWrongPassword:
                
                onComplete?("You entered a wrong password", nil)
                break
                
            case .errorCodeUserNotFound:
                
                onComplete?("The user was not found", nil)
                break
                
            default:
                
                onComplete?("There was a problem authenticating. Try again!", nil)

            }
        }
    }
}
