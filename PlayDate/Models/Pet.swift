//
//  Pet.swift
//  PlayDate
//
//  Created by Denielle Abaquita on 11/8/21.
//
//  Group 2:
//  Gustavo Cornejo, Denielle Abaquita, Michael Cubero, Nathan Moulton
//

import UIKit
import FirebaseFirestore

let coll = db.collection("pets")


struct Pet {
    private var name : String?
    private var age : Int?
    private var bio : String?
    private var type: String?
    private var sex: String?
    private var id: String
    
    //Create another constructor for the loaded document
    init(){
        // generate document with unique id then save THAT as pet id
        // load pet data to corresponding user pet entry here also.
        var ref : DocumentReference? = nil
        
        ref = coll.addDocument(data:[
            "name" : " ",
            "type" : " ",
            "sex" : " "
            ])
        
        self.id = ref!.documentID
    }
    
    init (id: String){
        self.id = id
    }
    
    func updateName(name: String){
        coll.document("\(self.id)").setData(["name": name], merge: true)
    }
    
    func updateType(type: String){
        coll.document("\(self.id)").setData(["type": type], merge: true)
    }
    
    func updateAge(age: Int){
        coll.document("\(self.id)").setData(["age": age], merge: true)

    }
    
    func updateSex(sex: String){
        coll.document("\(self.id)").setData(["sex": sex], merge: true)

    }
    
    func updateBio(bio: String){
        coll.document("\(self.id)").setData(["bio": bio], merge: true)

    }
    
    func getID()-> String{
        return self.id
    }
    
    func getInfo(completion: @escaping (Dictionary<String, Any>?)-> Void ){
        //var doc : Dictionary<String, Any> = Dictionary<String, Any>()
        let docRef = coll.document(self.id)
        
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
    
}
