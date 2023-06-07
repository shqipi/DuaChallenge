//
//  Team.swift
//  DuaChallenge
//
//  Created by shqiperimramadani on 05.06.23.
//

import Foundation

class Team {
    var name: String
    var points: Int
    var teamLogo: String
    var coachName: String
    var goalDifference: Int
    var city: String
    
    init(name: String, points: Int, teamLogo: String, coachName: String,goalDifference: Int, city: String) {
        self.name = name
        self.points = points
        self.teamLogo = teamLogo
        self.coachName = coachName
        self.goalDifference = goalDifference
        self.city = city
    }
    
    
}
