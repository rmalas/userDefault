//
//  SearchCoordinates.swift
//  mapApplication
//
//  Created by Roman Malasnyak on 4/10/18.
//  Copyright © 2018 Roman Malasnyak. All rights reserved.
//

import Foundation

typealias UserList = [[String:String]]

class CoordinatesHelper {
    private init() { }
    
    
    var latitude = 0.0
    var longitude = 0.0
    var currentUser = ""
    var rememberUser = ""
    var userList: UserList = []
    static let shared = CoordinatesHelper()
}
