//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Matt Haliski on 12/21/22.
//

import Foundation

enum UserFetchingClient {
  // swiftlint:disable:next force_unwrapping
  static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!

  static func getUsers() async throws -> String {
    async let (data, _) = URLSession.shared.data(from: url)
    if let value = try await String(data: data, encoding: .utf8) {
      return value
    } else {
      throw UserError.failedStringConversion
    }
  }
}

enum UserError: Error {
  case failedStringConversion
}
