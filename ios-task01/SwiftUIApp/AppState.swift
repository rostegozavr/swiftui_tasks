//
//  AppState.swift
//  SwiftUIApp
//
//  Created by Rostislav Permyakov on 09.03.2020.
//  Copyright © 2020 ePayments. All rights reserved.
//

import Foundation

final class AppState: ObservableObject {

    @Published var selectedTab: RootView.TabItem
    @Published var selectedTaskTag: String?
    
    static var shared = AppState()
    
    private init() {
        selectedTab = .taskListTab
    }
    
    func setSelectedTab(_ tab: RootView.TabItem, taskTag: String? = nil) {
        selectedTab = tab
        selectedTaskTag = taskTag
    }
}
