import XCTest
@testable import Pokedex

class EnvironmentKeyTests: XCTestCase {
    func testShouldReturnBoolValue() throws {
        @EnvironmentKey("TEST_BOOL")
        var boolValue: Bool

        XCTAssertTrue(boolValue)
    }
    
    func testShouldReturnDefaultValueWhenBoolIsMissing() throws {
        @EnvironmentKey("MISSING_BOOL", false)
        var missingBoolValue: Bool

        XCTAssertFalse(missingBoolValue)
    }
    
    func testShouldReturnIntValue() throws {
        @EnvironmentKey("TEST_INT")
        var intValue: Int

        XCTAssertEqual(intValue, 123)
    }
    
    func testShouldReturnDefaultValueWhenIntIsMissing() throws {
        @EnvironmentKey("MISSING_INT", 42)
        var missingIntValue: Int

        XCTAssertEqual(missingIntValue, 42)
    }

    func testShouldReturnDoubleValue() throws {
        @EnvironmentKey("TEST_DOUBLE")
        var doubleValue: Double

        XCTAssertEqual(doubleValue, 3.14)
    }
    
    func testShouldReturnDefaultValueWhenDoubleIsMissing() throws {
        @EnvironmentKey("MISSING_DOUBLE", 3.14)
        var missingDoubleValue: Double

        XCTAssertEqual(missingDoubleValue, 3.14)
    }
    
    func testShouldReturnStringValue() throws {
        @EnvironmentKey("TEST_STRING")
        var stringValue: String

        XCTAssertEqual(stringValue, "Hello World!")
    }
    
    func testShouldReturnDefaultValueWhenStringIsMissing() throws {
        @EnvironmentKey("MISSING_STRING", "defaultValue")
        var missingStringValue: String

        XCTAssertEqual(missingStringValue, "defaultValue")
    }
}
