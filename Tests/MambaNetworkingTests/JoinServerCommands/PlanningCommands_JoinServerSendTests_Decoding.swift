//
//  PlanningCommands_JoinServerSendTests_Decoding.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest 
@testable import MambaNetworking

class PlanningCommands_JoinServerSendTests_Decoding: XCTestCase {
    private var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func testInvalidParsingCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.invalidEncodedCommand
        
        // When: JSON is mapped to a command
        guard let data = mockedJson.data(using: .utf8) else {
            XCTFail("Error thrown")
            return
        }
        
        XCTAssertThrowsError(try decoder.decode(PlanningCommands.JoinServerSend.self, from: data))
    }
    
    func testNoneStateCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.StatesEncoded.noneState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .noneState(let message) = command {
            XCTAssertEqual(message.sessionCode, TestDataGenerator.States.stateMessage.sessionCode)
            XCTAssertEqual(message.sessionName, TestDataGenerator.States.stateMessage.sessionName)
            XCTAssertEqual(message.availableCards, TestDataGenerator.States.stateMessage.availableCards)
            
            XCTAssertEqual(message.participants.first?.participantId, TestDataGenerator.States.stateMessage.participants.first?.participantId)
            XCTAssertEqual(message.participants.first?.name, TestDataGenerator.States.stateMessage.participants.first?.name)
            
            XCTAssertEqual(message.ticket?.title, TestDataGenerator.States.stateMessage.ticket?.title)
            XCTAssertEqual(message.ticket?.description, TestDataGenerator.States.stateMessage.ticket?.description)
            
            XCTAssertEqual(message.ticket?.ticketVotes.first?.selectedCard, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.selectedCard)
            XCTAssertEqual(message.ticket?.ticketVotes.first?.participantId, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.participantId)
            XCTAssertEqual(message.updated, TestDataGenerator.States.stateMessage.updated)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testVotingStateCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.StatesEncoded.votingState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .votingState(let message) = command {
            XCTAssertEqual(message.sessionCode, TestDataGenerator.States.stateMessage.sessionCode)
            XCTAssertEqual(message.sessionName, TestDataGenerator.States.stateMessage.sessionName)
            XCTAssertEqual(message.availableCards, TestDataGenerator.States.stateMessage.availableCards)
            
            XCTAssertEqual(message.participants.first?.participantId, TestDataGenerator.States.stateMessage.participants.first?.participantId)
            XCTAssertEqual(message.participants.first?.name, TestDataGenerator.States.stateMessage.participants.first?.name)
            
            XCTAssertEqual(message.ticket?.title, TestDataGenerator.States.stateMessage.ticket?.title)
            XCTAssertEqual(message.ticket?.description, TestDataGenerator.States.stateMessage.ticket?.description)
            
            XCTAssertEqual(message.ticket?.ticketVotes.first?.selectedCard, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.selectedCard)
            XCTAssertEqual(message.ticket?.ticketVotes.first?.participantId, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.participantId)
            XCTAssertEqual(message.updated, TestDataGenerator.States.stateMessage.updated)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testFinishedVotingStateCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.StatesEncoded.finishedVotingState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .finishedState(let message) = command {
            XCTAssertEqual(message.sessionCode, TestDataGenerator.States.stateMessage.sessionCode)
            XCTAssertEqual(message.sessionName, TestDataGenerator.States.stateMessage.sessionName)
            XCTAssertEqual(message.availableCards, TestDataGenerator.States.stateMessage.availableCards)
            
            XCTAssertEqual(message.participants.first?.participantId, TestDataGenerator.States.stateMessage.participants.first?.participantId)
            XCTAssertEqual(message.participants.first?.name, TestDataGenerator.States.stateMessage.participants.first?.name)
            
            XCTAssertEqual(message.ticket?.title, TestDataGenerator.States.stateMessage.ticket?.title)
            XCTAssertEqual(message.ticket?.description, TestDataGenerator.States.stateMessage.ticket?.description)
            
            XCTAssertEqual(message.ticket?.ticketVotes.first?.selectedCard, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.selectedCard)
            XCTAssertEqual(message.ticket?.ticketVotes.first?.participantId, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.participantId)
            XCTAssertEqual(message.updated, TestDataGenerator.States.stateMessage.updated)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testInvalidCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerSendEncoded.invalidCommand
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .invalidCommand(let message) = command {
            XCTAssertEqual(message.code, TestDataGenerator.JoinServerSend.invalidCommandMessage.code)
            XCTAssertEqual(message.description, TestDataGenerator.JoinServerSend.invalidCommandMessage.description)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testInvalidSessionCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerSendEncoded.invalidSessionCommand
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .invalidSession = command { } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testRemoveParticipantCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerSendEncoded.removeParticipantCommand
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .removeParticipant = command { } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testEndSessionCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerSendEncoded.endSessionCommand
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .endSession = command { } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testSessionIdleTimeoutCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.JoinServerSendEncoded.sessionIdleTimeout
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .sessionIdleTimeout = command { } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testCoffeeVotingCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.StatesEncoded.coffeeVotingState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .coffeeVoting(let message) = command {
            XCTAssertEqual(message.sessionCode, TestDataGenerator.States.stateMessage.sessionCode)
            XCTAssertEqual(message.sessionName, TestDataGenerator.States.stateMessage.sessionName)
            XCTAssertEqual(message.availableCards, TestDataGenerator.States.stateMessage.availableCards)
            
            XCTAssertEqual(message.participants.first?.participantId, TestDataGenerator.States.stateMessage.participants.first?.participantId)
            XCTAssertEqual(message.participants.first?.name, TestDataGenerator.States.stateMessage.participants.first?.name)
            
            XCTAssertEqual(message.ticket?.title, TestDataGenerator.States.stateMessage.ticket?.title)
            XCTAssertEqual(message.ticket?.description, TestDataGenerator.States.stateMessage.ticket?.description)
            
            XCTAssertEqual(message.ticket?.ticketVotes.first?.selectedCard, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.selectedCard)
            XCTAssertEqual(message.ticket?.ticketVotes.first?.participantId, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.participantId)
            XCTAssertEqual(message.updated, TestDataGenerator.States.stateMessage.updated)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
    
    func testCoffeeVotingFinishedCommandDecoding() {
        // Given: mocked json
        let mockedJson = TestDataGenerator.StatesEncoded.coffeeVotingFinishedState
        
        // When: JSON is mapped to a command
        guard
            let data = mockedJson.data(using: .utf8),
            let command = try? decoder.decode(PlanningCommands.JoinServerSend.self, from: data)
        else {
            XCTFail("Error thrown")
            return
        }
        
        // Then: The decoded value matches the expected value
        if case .coffeeVotingFinished(let message) = command {
            XCTAssertEqual(message.sessionCode, TestDataGenerator.States.stateMessage.sessionCode)
            XCTAssertEqual(message.sessionName, TestDataGenerator.States.stateMessage.sessionName)
            XCTAssertEqual(message.availableCards, TestDataGenerator.States.stateMessage.availableCards)
            
            XCTAssertEqual(message.participants.first?.participantId, TestDataGenerator.States.stateMessage.participants.first?.participantId)
            XCTAssertEqual(message.participants.first?.name, TestDataGenerator.States.stateMessage.participants.first?.name)
            
            XCTAssertEqual(message.ticket?.title, TestDataGenerator.States.stateMessage.ticket?.title)
            XCTAssertEqual(message.ticket?.description, TestDataGenerator.States.stateMessage.ticket?.description)
            
            XCTAssertEqual(message.ticket?.ticketVotes.first?.selectedCard, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.selectedCard)
            XCTAssertEqual(message.ticket?.ticketVotes.first?.participantId, TestDataGenerator.States.stateMessage.ticket?.ticketVotes.first?.participantId)
            XCTAssertEqual(message.updated, TestDataGenerator.States.stateMessage.updated)
        } else {
            XCTFail("Wrong command has been mapped")
        }
    }
}
