import XCTest
@testable import mamba_ios_networking

final class mamba_ios_networkingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(mamba_ios_networking().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
