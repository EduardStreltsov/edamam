@testable import edamam
import ViewInspector
import XCTest

extension ContentView: Inspectable {}

class ContentViewTests: XCTestCase {
	
    // static view test example
	func test_containsTwoTabs() throws {
		let subject = ContentView()
		let tabCount = try subject.inspect().tabView().count
		let expectedTabCount = 2
		XCTAssertEqual(tabCount, expectedTabCount)
	}
}
