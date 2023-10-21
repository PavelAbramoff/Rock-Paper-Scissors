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
    
    func getUserStatisticData() -> Results<UserStatisticModel> {
        realm.objects(UserStatisticModel.self)
    }
    
    func saveUserStatisticData(_ model: UserStatisticModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    func getUserWins(name: String) -> Int {
         let allStatisticGames = RealmManager.shared.getUserStatisticData()
         
        let predicate = NSPredicate(format: "username = '\(name)'")
        let filteredArray = allStatisticGames.filter(predicate).sorted(byKeyPath: "winsNumber").map{ $0 }
        let sumWins = filteredArray.reduce(0) { (result, number) in
            return result + number.winsNumber
        }
        let sumGames = filteredArray.reduce(0) { (result, number) in
            return result + number.gamesNumber
        }
//        let winningPercentage = sumWins * 100 / sumGames
        return sumGames == 0 ? sumGames : sumWins * 100 / sumGames
    }
}
