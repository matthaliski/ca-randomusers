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

  static func getUsers() async throws -> [User] {
    async let (data, _) = URLSession.shared.data(from: url)
    let response = try await JSONDecoder().decode(Response.self, from: data)
    return response.users
  }
}
