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
        let mockedCommand = TestDataGenerator.HostServerReceive.addTicket
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.addTicket)
    }
    
    func testStartSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.startSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.startSession)
    }
    
    func testSkipVoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.skipVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.skipVote)
    }
    
    func testRemoveParticipantCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.removeParticipant
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.removeParticipant)
    }
    
    func testEndSessionCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.endSession
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.endSession)
    }
    
    func testFinishVotingCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.finishVoting
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.finishVoting)
    }
    
    func testReconnectCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.reconnect
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.reconnect)
    }
    
    func testRevoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.revote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.revote)
    }

    func testEditTicketCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.editTicket
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.editTicket)
    }
    
    func testAddTimerCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.addTimer
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.addTimer)
    }
    
    func testCancelTimerCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.cancelTimer
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.cancelTimer)
    }
    
    func testPreviousTicketsCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.previousTickets
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.previousTickets)
    }
    
    func testRequestCoffeeBreakCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.requestCoffeeBreak
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.requestCoffeeBreak)
    }
    
    func testStartCoffeeBreakCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.startCoffeeBreakVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.startCoffeeBreakVote)
    }
    
    func testEndCoffeeBreakCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.endCoffeeBreakVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.endCoffeeBreakVote)
    }
    
    func testCoffeeBreakVoteCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.coffeeBreakVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.coffeBreakVote)
    }
    
    func testFinishCoffeeBreakCommandEncoding() {
        // Given: a mocked command
        let mockedCommand = TestDataGenerator.HostServerReceive.finishCoffeeBreakVote
        
        // When: Command is mapped to JSON
        guard let data = try? JSONEncoder().encode(mockedCommand) else {
            XCTFail("Error thrown")
            return
        }
        let jsonCommand = String(decoding: data, as: UTF8.self)
        
        // Then: The encoded value matches the expected value
        XCTAssertEqual(jsonCommand, TestDataGenerator.HostServerReceiveEncoded.finishCoffeeBreakVote)
    }
}
