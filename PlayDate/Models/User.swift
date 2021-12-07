//
//  User.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

let db = Firestore.firestore()
let col = db.collection("users")


// Only really nead to store id.
class User {
    private var name: String?
    private var age: Int?
    private var userID: String
    private var pets : [Pet]?
    private var bio: String?
    
    
    init(userID: String){
        self.userID = userID
        //col.document(userID).set
        
    }
    
    func updateName(name: String){
        col.document(userID).setData(["name": name], merge: true)
    }
    
    func updateAge(age: Int){
        col.document(userID).setData(["age": age], merge: true)

    }
    // To be called after recieving petId generated from Pet object
    func addPet(petID: String){
        //to be coded...
        //self.pets.append()
        let petsRefString = db.collection("pets").document("\(petID)")
        let petsRef = db.document("pets/\(petID)")
        
        col.document(userID).updateData([
            "pets": FieldValue.arrayUnion([petsRef])])
        

    }
    
    func updateBio(bio: String){
        col.document(userID).setData(["bio": bio], merge: true)

    }
    
    func getInfo(completion: @escaping (Dictionary<String, Any>?)-> Void ){
        //var doc : Dictionary<String, Any> = Dictionary<String, Any>()
        let docRef = col.document(self.userID)
        
        docRef.getDocument{(document, error) in
            if let document = document, document.exists{
                let data = document.data()! as Dictionary?
                completion(data)
            } else {
                print("problem")
                completion(nil)
            }
        }
    }
    
    // Don't use this right now. Needs a completion handler
    func getPets()->[Pet]{
        //var doc : Dictionary<String, Any> = Dictionary<String, Any>()
        let docRef = col.document(self.userID)
        
        docRef.getDocument{(document, error) in
            if let document = document, document.exists{
                let data = document.data()! as Dictionary?
                let pets = data!["pets"] as! Array<DocumentReference>
                for pet in pets{
                    self.pets?.append(Pet(id: pet.documentID))
                }
            } else {
                print("problem")
            }
        }
        
        return self.pets!
    }
    
    func testUserDB() {
        var doc : Dictionary<String, Any> = Dictionary<String, Any>()
        
        self.updateName(name: "Olufemi")
        self.updateBio(bio: "Also kinda cool. Likes dogs")
        self.updateAge(age: 27)
        
        let pet1 = Pet()
        
        pet1.updateName(name: "Baxter Bromley")
        pet1.updateBio(bio: "A real cute pupper")
        pet1.updateAge(age: 1)
        
        addPet(petID: pet1.getID())
        
        self.getInfo (completion: { (doc) in
            if let thing = doc{
                print("The doc is: \(thing)")
                let petStuff = thing["pets"] as! Array<DocumentReference>
                print("Pet ID is hopefully  \(petStuff[0].documentID)")
                
                
            }
        })
        // Current way to acces user pets. Will be updated soon...
       let thing2 = self.getPets()
        
        for pet in thing2{
            print(pet.getID())
        }
        
    }
}
