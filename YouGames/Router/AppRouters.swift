//
//  AppRouters.swift
//  YouGames
//
//  Created by sona setiana on 18/06/22.
//

import Foundation
import SwiftUI

class AppRouters {
    static func toHomeView() -> some View {
        return HomeView()
    }
    static func toDetailView() -> some View {
        return DetailView()
    }
    static func toProfileView() -> some View {
        return ProfileView()
    }
}
