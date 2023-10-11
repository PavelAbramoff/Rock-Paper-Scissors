//
//  UserStatisticModel.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 08.10.2023.
//

import Foundation
import RealmSwift

class UserStatisticModel: Object {
    @Persisted var username: String = ""
    @Persisted var gamesNumber: Int = 0
    @Persisted var winsNumber: Int = 0
}


struct LeaderboardEntry {
    var name: String
    var score: Int
    var rank: Int
}
