//
//  AuthManager.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//

import Foundation
import FirebaseAuth

class AuthManager{
    
    private var client : Auth
    private var email : String
    private var password: String
    
    init(email:String, password:String){
        self.email = email
        self.password = password
        self.client = FirebaseAuth.Auth.auth() // Auth instance. Will hold user creds
    }
    // Reference literature on swift closures for use.
    // Or just look at theregisterviewcontroller.
    func register (completionBlock: @escaping(_ success: Bool) -> Void) {
        
        client.createUser(withEmail: email, password: password, completion: { (result, error) in
            if let user = result?.user{
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        })

    }
    
    // Works like register(). Communicates with the user db and persists the
    // success boolean out to the caller.
    func login(completionBlock: @escaping(_ success: Bool) -> Void){
        client.signIn(withEmail: email, password: password, completion: { result, error in
            if let user = result?.user{
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        })
    }

    func signOut(){
        do {
            try client.signOut()
        }catch let error as NSError {
            print("\(error)")
        }
        
    }

}
