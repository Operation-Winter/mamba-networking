//
//  PlanningVoteMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/08/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningVoteMessage: Codable {
    public let selectedCard: PlanningCard
    public let tag: String?
    
    public init(selectedCard: PlanningCard, tag: String?) {
        self.selectedCard = selectedCard
        self.tag = tag
    }
}
