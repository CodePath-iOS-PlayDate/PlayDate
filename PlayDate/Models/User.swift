//
//  User.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

let db = Firestore.firestore()
let col = db.collection("users")

class User {
    private var name: String?
    private var age: Int?
    private var userID: String
    //private var pets = [Pet]()
    private var bio: String?
    
    
    init(userID: String){
        self.userID = userID
        
    }
    
    func updateName(name: String){
        col.document(userID).setData(["name": name], merge: true)
    }
    
    func updateAge(age: Int){
        col.document(userID).setData(["age": age], merge: true)

    }
    
    //func addPet(pet: Pet){
        //to be coded...
    //}
    
    func updateBio(bio: String){
        col.document(userID).setData(["bio": bio], merge: true)

    }
    
    func getInfo()-> Dictionary<String, Any>{
        
        let docRef = col.document(self.userID)
        
        // placeholder:
        return ["name": "Esther", "age": 27, "id" : 1234567 ]
    }
    
}
