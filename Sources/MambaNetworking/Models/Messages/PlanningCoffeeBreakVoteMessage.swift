//
//  PlanningCoffeeBreakVoteMessage.swift
//  
//
//  Created by Armand Kamffer on 2022/04/17.
//

import Foundation

public struct PlanningCoffeeBreakVoteMessage: Codable {
    public let vote: Bool
    
    public init(vote: Bool) {
        self.vote = vote
    }
}
