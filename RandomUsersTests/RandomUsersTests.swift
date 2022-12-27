//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by Matt Haliski on 12/21/22.
//

import XCTest
@testable import RandomUsers

final class RandomUsersTests: XCTestCase {
  func testUserModel() throws {
    let jsonData = getTestJSONData()

    do {
      _ = try JSONDecoder().decode(Response.self, from: jsonData)
    } catch {
      XCTFail("Failed to decode JSON into the model: \(error)")
    }
  }

  private func getTestJSONData() -> Data {
    // The "Bundle" is essentially the parent directory of your app.
    // forResource: the filename
    // ofType: the filetype
    guard let path = Bundle.main.path(forResource: "randomUsers", ofType: "json") else {
      fatalError("randomUsers.json file not found")
    }
    let internalURL = URL(fileURLWithPath: path)
    // swiftlint:disable:next force_try
    return try! Data(contentsOf: internalURL)
  }
}
