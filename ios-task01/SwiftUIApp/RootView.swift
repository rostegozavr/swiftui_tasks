//
//  RootView.swift
//  SwiftUIApp
//
//  Created by Rostislav Permyakov on 08.03.2020.
//  Copyright © 2020. All rights reserved.
//

import SwiftUI

struct RootView: View {

    @EnvironmentObject var appState: AppState
    
    @EnvironmentObject var quickLinkViewModel: QuickLinkViewModel
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $appState.selectedTab) {
            QuickLinkView()
                .environmentObject(quickLinkViewModel)
                .tag(TabItem.quickLinkTab)
                .tabItem {
                    VStack {
                        Text("Главное")
                        Image(systemName: "bolt")
                    }
                }
            TaskListView()
                .environmentObject(taskListViewModel)
                .tag(TabItem.taskListTab)
                .tabItem {
                    VStack {
                        Text("Продукты")
                        Image(systemName: "list.bullet")
                    }
                }
            AboutView()
                .tag(TabItem.aboutViewTab)
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("О программе")
                }
        }
    }
}

extension RootView {
    enum TabItem: Hashable {
        case quickLinkTab
        case taskListTab
        case aboutViewTab
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
