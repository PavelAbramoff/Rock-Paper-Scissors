//
//  UserModel.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 03.10.2023.
//

import Foundation
import RealmSwift

class UserModel: Object {
    @Persisted var username: String = ""
    @Persisted var password: String = ""
}
