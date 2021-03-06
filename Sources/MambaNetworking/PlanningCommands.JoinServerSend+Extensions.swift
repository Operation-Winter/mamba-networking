//
//  PlanningCommand.JoinServerSend+Extensions.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/31.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public extension PlanningCommands.JoinServerSend {
    private enum CodingKeys: String, CodingKey {
        case type
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case PlanningCommands.JoinKey.noneState.rawValue:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .noneState(message: model)
        case PlanningCommands.JoinKey.votingState.rawValue:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .votingState(message: model)
        case PlanningCommands.JoinKey.finishedState.rawValue:
            let model = try container.decode(PlanningSessionStateMessage.self, forKey: .message)
            self = .finishedState(message: model)
        case PlanningCommands.JoinKey.invalidCommand.rawValue:
            let model = try container.decode(PlanningInvalidCommandMessage.self, forKey: .message)
            self = .invalidCommand(message: model)
        case PlanningCommands.JoinKey.invalidSession.rawValue:
            self = .invalidSession
        case PlanningCommands.JoinKey.removeParticipant.rawValue:
            self = .removeParticipant
        case PlanningCommands.JoinKey.endSession.rawValue:
            self = .endSession
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
        default:
            break
        }
    }
    
    var rawValue: String {
        switch self {
        case .noneState(_): return PlanningCommands.JoinKey.noneState.rawValue
        case .votingState(_): return PlanningCommands.JoinKey.votingState.rawValue
        case .finishedState(_): return PlanningCommands.JoinKey.finishedState.rawValue
        case .invalidCommand: return PlanningCommands.JoinKey.invalidCommand.rawValue
        case .invalidSession: return PlanningCommands.JoinKey.invalidSession.rawValue
        case .removeParticipant: return PlanningCommands.JoinKey.removeParticipant.rawValue
        case .endSession: return PlanningCommands.JoinKey.endSession.rawValue
        }
    }
}
