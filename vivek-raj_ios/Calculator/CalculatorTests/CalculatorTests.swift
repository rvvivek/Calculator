//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Raj, Vivek R. (623-Extern) on 28/11/22.
//

import XCTest
@testable import Calculator

var sut: CalculatorView!
@MainActor class CalculatorTests: XCTestCase {
    private var viewModel: CalculatorView.ViewModel!

    @MainActor override func setUp() {
        super.setUp()
        viewModel = CalculatorView.ViewModel()
    }
    @MainActor  override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            viewModel = nil
            try super.tearDownWithError()
    }
    func testSum() {
        viewModel.performAction(for: .digit(.one))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .operation(.addition))
        viewModel.performAction(for: .digit(.two))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .equals)
        XCTAssertEqual(viewModel.displayText, "300", "Sum of 100 and 200 must be 300")
        
    }
    
    func testSubtraction() {
        viewModel.performAction(for: .digit(.one))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .operation(.subtraction))
        viewModel.performAction(for: .digit(.two))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .equals)
        XCTAssertEqual(viewModel.displayText, "-100", "difference of 100 and 200 must be -100")
    }

    func testMultiply() {
        viewModel.performAction(for: .digit(.one))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .operation(.multiplication))
        viewModel.performAction(for: .digit(.two))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .equals)
        XCTAssertEqual(viewModel.displayText, "20,000", "multiplication of 100 and 200 must be 20,000")
    }
    func testDivision() {
        viewModel.performAction(for: .digit(.one))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .operation(.division))
        viewModel.performAction(for: .digit(.two))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .digit(.zero))
        viewModel.performAction(for: .equals)
        XCTAssertEqual(viewModel.displayText, "0.5", "multiplication of 100 and 200 must be 0.5")
    }
    
}

