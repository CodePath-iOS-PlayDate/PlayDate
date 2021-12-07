//
//  AuthManager.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import Foundation
import FirebaseAuth

class AuthManager{
    
    static var client : Auth = FirebaseAuth.Auth.auth()
    static var email : String?
    static var password: String?
    static var user: User?
    static var id: String?
    
    // Reference literature on swift closures for use.
    // Or just look at theregisterviewcontroller.
    static func register(completionBlock: @escaping(_ success: Bool) -> Void) {
        guard let email = AuthManager.email,
              let password = AuthManager.password else {
            print("Error! Could not register since AuthManager does not have a valid email or password")
            return
        }
        AuthManager.client.createUser(withEmail: email, password: password, completion: { (result, error) in
            if let user = result?.user{
                print( "UserID is \(user.uid)")
                self.id = user.uid
                self.user = User(userID: self.id!)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        })

    }
    
    // Works like register(). Communicates with the user db and persists the
    // success boolean out to the caller.
    static func login(completionBlock: @escaping(_ success: Bool) -> Void){
        guard let email = AuthManager.email,
              let password = AuthManager.password else {
            print("Error! Could not login since AuthManager does not have a valid email or password")
            return
        }
        AuthManager.client.signIn(withEmail: email, password: password, completion: { result, error in
            if let user = result?.user{
                print(user.uid)
                self.user = User(userID: user.uid)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        })
    }

    static func signOut(completionBlock: @escaping(_ success: Bool) -> Void){
        do {
            try AuthManager.client.signOut()
            completionBlock(true)
        }catch let error as NSError {
            completionBlock(false)
        }
    }
}
