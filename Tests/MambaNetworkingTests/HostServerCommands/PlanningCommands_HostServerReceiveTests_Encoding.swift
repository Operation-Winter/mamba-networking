//
//  PlanningCommands_HostServerReceiveTests_Encoding.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MambaNetworking

class PlanningCommands_HostServerReceiveTests_Encoding: XCTestCase {

    func testAddTicketCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.addTicket
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.addTicket)
    }
    
    func testStartSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.startSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.startSession)
    }
    
    func testSkipVoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.skipVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.skipVote)
    }
    
    func testRemoveParticipantCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.removeParticipant
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.removeParticipant)
    }
    
    func testEndSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.endSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.endSession)
    }
    
    func testFinishVotingCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.finishVoting
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.finishVoting)
    }
    
    func testReconnectCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.reconnect
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.reconnect)
    }
    
    func testRevoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.revote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.revote)
    }

    func testEditTicketCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.editTicket
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.editTicket)
    }
    
    func testAddTimerCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.addTimer
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.addTimer)
    }
    
    func testCancelTimerCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.cancelTimer
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.cancelTimer)
    }
    
    func testPreviousTicketsCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = Mocks.previousTickets
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, Expected.previousTickets)
    }
}

fileprivate class Mocks {
    static let addTicket: PlanningCommands.HostServerReceive = {
        let message = PlanningTicketMessage(title: "x", description: "Test", selectedTags: ["Tag"])
        return .addTicket(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let startSession: PlanningCommands.HostServerReceive = {
        let message = PlanningStartSessionMessage(sessionName: "Test", autoCompleteVoting: false, availableCards: [PlanningCard.question], password: "password")
        return .startSession(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let skipVote: PlanningCommands.HostServerReceive = {
        let message = PlanningSkipVoteMessage(participantId: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
        return .skipVote(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let removeParticipant: PlanningCommands.HostServerReceive = {
        let message = PlanningRemoveParticipantMessage(participantId: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
        return .removeParticipant(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let endSession = PlanningCommands.HostServerReceive.endSession(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    static let finishVoting = PlanningCommands.HostServerReceive.finishVoting(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    static let reconnect = PlanningCommands.HostServerReceive.reconnect(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    static let revote = PlanningCommands.HostServerReceive.revote(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    
    static let editTicket: PlanningCommands.HostServerReceive = {
        let message = PlanningTicketMessage(title: "x", description: "Test", selectedTags: ["Tag"])
        return .editTicket(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let addTimer: PlanningCommands.HostServerReceive = {
        let message = PlanningAddTimerMessage(time: 2)
        return .addTimer(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID(), message: message)
    }()
    
    static let cancelTimer = PlanningCommands.HostServerReceive.cancelTimer(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
    
    static let previousTickets = PlanningCommands.HostServerReceive.previousTickets(uuid: UUID(uuidString: "754909ED-1648-4B51-AB55-4CA6C8910231") ?? UUID())
}

fileprivate class Expected {
    static let addTicket = """
        {"type":"ADD_TICKET","message":{"title":"x","selectedTags":["Tag"],"description":"Test"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let startSession = """
        {"type":"START_SESSION","message":{"password":"password","autoCompleteVoting":false,"availableCards":["QUESTION"],"sessionName":"Test"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let skipVote = """
        {"type":"SKIP_VOTE","message":{"participantId":"754909ED-1648-4B51-AB55-4CA6C8910231"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let removeParticipant = """
        {"type":"REMOVE_PARTICIPANT","message":{"participantId":"754909ED-1648-4B51-AB55-4CA6C8910231"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let endSession = """
        {"type":"END_SESSION","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let finishVoting = """
        {"type":"FINISH_VOTING","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let reconnect = """
        {"type":"RECONNECT","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let revote = """
        {"type":"REVOTE","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let editTicket = """
        {"type":"EDIT_TICKET","message":{"title":"x","selectedTags":["Tag"],"description":"Test"},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let addTimer = """
        {"type":"ADD_TIMER","message":{"time":2},"uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let cancelTimer = """
        {"type":"CANCEL_TIMER","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
    
    static let previousTickets = """
        {"type":"PREVIOUS_TICKETS","uuid":"754909ED-1648-4B51-AB55-4CA6C8910231"}
        """
}
