//
//  PlanningCoffeeVote.swift
//  
//
//  Created by Armand Kamffer on 2022/04/17.
//

import Foundation

public class PlanningCoffeeVote: Codable {
    public private(set) var participantId: UUID
    public private(set) var vote: Bool
    
    public init(participantId: UUID, vote: Bool) {
        self.participantId = participantId
        self.vote = vote
    }
}
