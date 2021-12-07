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


// Only really nead to store id.
class User {
    private var name: String?
    private var age: Int?
    private var userID: String
    private var pets : [Pet]?
    private var bio: String?
    
    
    init(userID: String){
        self.userID = userID
        
    }
    
    func updateContact(contact: String){
        col.document(userID).setData(["contact": contact], merge: true)
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
    
    func getPets(completion: @escaping ([Pet]?)-> Void ){
        //var doc : Dictionary<String, Any> = Dictionary<String, Any>()
        let docRef = col.document(self.userID)
        
        docRef.getDocument{(document, error) in
            if let document = document, document.exists{
                let data = document.data()! as Dictionary?
                let pets = data!["pets"] as! Array<DocumentReference>
                var petsArray = [Pet]()
                for pet in pets{
                    petsArray.append(Pet(id: pet.documentID))
                }
                completion(petsArray)
            } else {
                completion(nil)
                print("problem")
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
    
    func addLikes(userID: String){
        let matchRef = db.document("users/\(userID)")
        
        col.document(userID).updateData([
            "likes": FieldValue.arrayUnion([matchRef])])
    }
    
    // To test
    func getMatches(completion: @escaping ([User]?)-> Void ){
        //var doc : Dictionary<String, Any> = Dictionary<String, Any>()
        let docRef = col.document(self.userID)
        
        docRef.getDocument{(document, error) in
            if let document = document, document.exists{
                let data = document.data()! as Dictionary?
                let match = data!["likes"] as! Array<DocumentReference>
                var matchArray = [User]()
                
                for thing in match{
                    thing.getDocument{(document2, error) in
                        if let document2 = document2, document2.exists{
                            let data2 = document2.data()! as Dictionary?
                            let match2 = data2!["likes"] as! Array<String>
                            
                            if match2.contains("user/\(self.userID)"){
                                matchArray.append(User(userID: thing.documentID))
                            }
                        } else {
                            print("problem! reference no longer exists")
                        }
                    }
                }
                completion(matchArray)
            } else {
                completion(nil)
                print("problem")
            }
        }
    }
        
    func testUserDB() {
        
        self.updateName(name: "Olufemi")
        self.updateBio(bio: "Also kinda cool. Likes dogs")
        self.updateAge(age: 27)
        
        let pet1 = Pet()
        
        pet1.updateName(name: "Buster Brown")
        pet1.updateBio(bio: "A real cute pupper")
        pet1.updateAge(age: 1)
        
        
        let pet2 = Pet()
        
        pet2.updateName(name: "Nigel Baxter")
        pet2.updateBio(bio: "A rather timid turtle")
        pet2.updateAge(age: 50)
        
        addPet(petID: pet1.getID())
        addPet(petID: pet2.getID())
        
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
