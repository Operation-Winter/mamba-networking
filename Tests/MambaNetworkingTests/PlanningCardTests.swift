//
//  PlanningCardTests.swift
//  mambaTests
//
//  Created by Armand Kamffer on 2020/08/10.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MambaNetworking

class PlanningCardTests: XCTestCase {

    func testRawValues() {
        // When: PlanningCard values are mapped
        let planningCards = PlanningCard.allCases
        
        // Then: the keys match expected values
        for (index, key) in planningCards.enumerated() {
            XCTAssertEqual(key.rawValue, Expected.cardKeys.element(at: index))
        }
    }

    func testImageNames() {
        // When: PlanningCard values are mapped
        let planningCards = PlanningCard.allCases
        
        // Then: the keys match expected values
        for (index, key) in planningCards.enumerated() {
            XCTAssertEqual(key.imageName, Expected.cardImageNames.element(at: index))
        }
    }
    
    func testTitles() {
        // When: PlanningCard values are mapped
        let planningCards = PlanningCard.allCases
        
        // Then: the keys match expected values
        for (index, key) in planningCards.enumerated() {
            XCTAssertEqual(key.title, Expected.cardTitles.element(at: index))
        }
    }
}

fileprivate class Expected {
    static let cardKeys = [
        "ZERO",
        "ONE",
        "TWO",
        "THREE",
        "FIVE",
        "EIGHT",
        "THIRTEEN",
        "TWENTY",
        "FOURTY",
        "HUNDRED",
        "QUESTION",
        "COFFEE"
    ]
    
    static let cardImageNames = [
        "PlanningCardZero",
        "PlanningCardOne",
        "PlanningCardTwo",
        "PlanningCardThree",
        "PlanningCardFive",
        "PlanningCardEight",
        "PlanningCardThirteen",
        "PlanningCardTwenty",
        "PlanningCardFourty",
        "PlanningCardHundred",
        "PlanningCardQuestion",
        "PlanningCardCoffee"
    ]
    
    static let cardTitles = [
        NSLocalizedString("PLANNING_CARD_ZERO_TITLE", comment: "0"),
        NSLocalizedString("PLANNING_CARD_ONE_TITLE", comment: "1"),
        NSLocalizedString("PLANNING_CARD_TWO_TITLE", comment: "2"),
        NSLocalizedString("PLANNING_CARD_THREE_TITLE", comment: "3"),
        NSLocalizedString("PLANNING_CARD_FIVE_TITLE", comment: "5"),
        NSLocalizedString("PLANNING_CARD_EIGHT_TITLE", comment: "8"),
        NSLocalizedString("PLANNING_CARD_THIRTEEN_TITLE", comment: "13"),
        NSLocalizedString("PLANNING_CARD_TWENTY_TITLE", comment: "20"),
        NSLocalizedString("PLANNING_CARD_FOURTY_TITLE", comment: "40"),
        NSLocalizedString("PLANNING_CARD_HUNDRED_TITLE", comment: "100"),
        NSLocalizedString("PLANNING_CARD_QUESTION_TITLE", comment: "?"),
        NSLocalizedString("PLANNING_CARD_COFFEE_TITLE", comment: "Coffee")
    ]
}
