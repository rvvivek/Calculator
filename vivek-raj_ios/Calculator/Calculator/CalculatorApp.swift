//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Raj, Vivek R. (623-Extern) on 28/11/22.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculatorView.ViewModel())

        }
    }
}
