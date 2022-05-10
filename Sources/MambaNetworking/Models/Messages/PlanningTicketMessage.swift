//
//  PlanningTicketMessage.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/08/07.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public struct PlanningTicketMessage: Codable {
    public let title: String
    public let description: String
    public let selectedTags: Set<String>
    
    public init(title: String, description: String, selectedTags: Set<String>) {
        self.title = title
        self.description = description
        self.selectedTags = selectedTags
    }
}
