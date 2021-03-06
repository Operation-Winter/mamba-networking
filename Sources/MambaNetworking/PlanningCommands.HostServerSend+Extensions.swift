//
//  PlanningCommands.HostServerSend+Extensions.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public extension PlanningCommands.HostServerSend {
    private enum CodingKeys: String, CodingKey {
        case type
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case PlanningCommands.HostKey.noneState.rawValue:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .noneState(message: model)
        case PlanningCommands.HostKey.votingState.rawValue:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .votingState(message: model)
        case PlanningCommands.HostKey.finishedState.rawValue:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .finishedState(message: model)
        case PlanningCommands.HostKey.invalidCommand.rawValue:
            let model = try container.decode(PlanningInvalidCommandMessage.self, forKey: .message)
            self = .invalidCommand(message: model)
        default:
            throw DecodingError.keyNotFound(CodingKeys.message, DecodingError.Context(codingPath: [], debugDescription: "Invalid key: \(type)"))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.rawValue, forKey: .type)
        
        switch self {
        case .noneState(let message): try container.encode(message, forKey: .message)
        case .votingState(let message): try container.encode(message, forKey: .message)
        case .finishedState(let message): try container.encode(message, forKey: .message)
        case .invalidCommand(let message): try container.encode(message, forKey: .message)
        }
    }
    
    var rawValue: String {
        switch self {
        case .noneState: return PlanningCommands.HostKey.noneState.rawValue
        case .votingState: return PlanningCommands.HostKey.votingState.rawValue
        case .finishedState: return PlanningCommands.HostKey.finishedState.rawValue
        case .invalidCommand: return PlanningCommands.HostKey.invalidCommand.rawValue
        }
    }
}
