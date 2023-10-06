//
//  RealmManager.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 06.10.2023.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func getUserData() -> Results<UserModel> {
        realm.objects(UserModel.self)
    }
    
    func saveUserData(_ model: UserModel) {
        try! realm.write {
            realm.add(model)
        }
    }
}
