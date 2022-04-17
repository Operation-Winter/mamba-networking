//
//  PlanningCommand.swift
//  MambaNetworking
//
//  Created by Armand Kamffer on 2020/07/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

public enum PlanningCommands {
    // MARK: - Planning Host Server Receive
    public enum HostServerReceiveKey: String, CaseIterable {
        case startSession = "START_SESSION"
        case addTicket = "ADD_TICKET"
        case skipVote = "SKIP_VOTE"
        case removeParticipant = "REMOVE_PARTICIPANT"
        case endSession = "END_SESSION"
        case finishVoting = "FINISH_VOTING"
        case revote = "REVOTE"
        case reconnect = "RECONNECT"
        case editTicket = "EDIT_TICKET"
        case addTimer = "ADD_TIMER"
        case cancelTimer = "CANCEL_TIMER"
        case previousTickets = "PREVIOUS_TICKETS"
    }

    public enum HostServerReceive: Codable {
        case startSession(uuid: UUID, message: PlanningStartSessionMessage)
        case addTicket(uuid: UUID, message: PlanningTicketMessage)
        case skipVote(uuid: UUID, message: PlanningSkipVoteMessage)
        case removeParticipant(uuid: UUID, message: PlanningRemoveParticipantMessage)
        case endSession(uuid: UUID)
        case finishVoting(uuid: UUID)
        case revote(uuid: UUID)
        case reconnect(uuid: UUID)
        case editTicket(uuid: UUID, message: PlanningTicketMessage)
        case addTimer(uuid: UUID, message: PlanningAddTimerMessage)
        case cancelTimer(uuid: UUID)
        case previousTickets(uuid: UUID)
    }
    
    // MARK: - Planning Host Server Send
    public enum HostServerSendKey: String, CaseIterable {
        case noneState = "NONE_STATE"
        case votingState = "VOTING_STATE"
        case finishedState = "FINISHED_STATE"
        case invalidCommand = "INVALID_COMMAND"
        case previousTickets = "PREVIOUS_TICKETS"
        case sessionIdleTimeout = "SESSION_IDLE_TIMEOUT"
    }
    
    public enum HostServerSend: Codable {
        case noneState(message: PlanningSessionStateMessage)
        case votingState(message: PlanningSessionStateMessage)
        case finishedState(message: PlanningSessionStateMessage)
        case invalidCommand(message: PlanningInvalidCommandMessage)
        case previousTickets(message: PlanningPreviousTicketsMessage)
        case sessionIdleTimeout
    }
    
    // MARK: - Planning Join Server Receive
    public enum JoinServerReceiveKey: String, CaseIterable {
        case joinSession = "JOIN_SESSION"
        case vote = "VOTE"
        case leaveSession = "LEAVE_SESSION"
        case reconnect = "RECONNECT"
        case changeName = "CHANGE_NAME"
    }
    
    public enum JoinServerReceive: Codable {
        case joinSession(uuid: UUID, message: PlanningJoinSessionMessage)
        case vote(uuid: UUID, message: PlanningVoteMessage)
        case leaveSession(uuid: UUID)
        case reconnect(uuid: UUID)
        case changeName(uuid: UUID, message: PlanningChangeNameMessage)
    }
    
    // MARK: - Planning Join Server Send
    public enum JoinServerSendKey: String, CaseIterable {
        case noneState = "NONE_STATE"
        case votingState = "VOTING_STATE"
        case finishedState = "FINISHED_STATE"
        case invalidCommand = "INVALID_COMMAND"
        case invalidSession = "INVALID_SESSION"
        case removeParticipant = "REMOVE_PARTICIPANT"
        case endSession = "END_SESSION"
        case sessionIdleTimeout = "SESSION_IDLE_TIMEOUT"
    }
    
    public enum JoinServerSend: Codable {
        case noneState(message: PlanningSessionStateMessage)
        case votingState(message: PlanningSessionStateMessage)
        case finishedState(message: PlanningSessionStateMessage)
        case invalidCommand(message: PlanningInvalidCommandMessage)
        case invalidSession
        case removeParticipant
        case endSession
        case sessionIdleTimeout
    }
}
