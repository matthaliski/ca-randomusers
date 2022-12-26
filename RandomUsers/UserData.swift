//
//  UserData.swift
//  RandomUsers
//
//  Created by Matt Haliski on 12/26/22.
//

import Foundation

@MainActor
class UserData: ObservableObject {
  @Published var users: [User] = []

  init() {
    Task {
      await loadUsers()
    }
  }

  func loadUsers() async {
    do {
      let users = try await UserFetchingClient.getUsers()
      self.users = users
    } catch {
      print(error)
    }
  }
}
