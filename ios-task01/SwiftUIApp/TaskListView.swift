//
//  TaskListView.swift
//  SwiftUIApp
//
//  Created by Rostislav Permyakov on 08.03.2020.
//  Copyright © 2020. All rights reserved.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let name: String
    let tag: String
    let isReady: Bool
}

final class TaskListViewModel: ObservableObject {
    
    @Published private(set) var isReadyButtonName = "Нужно купить"
    
    @Published private(set) var tasks = [Task(name: "Молоко", tag: "milk", isReady: true),
                                         Task(name: "Сыр", tag: "cheese", isReady: true),
                                         Task(name: "Хлеб", tag: "bread", isReady: false),
                                         Task(name: "Кетчуп", tag: "ketchup", isReady: false)]
}

struct FilterView: View {
    @Binding var readyVisible: Bool
    
    @EnvironmentObject var viewModel: TaskListViewModel
    
    var body: some View {
        Toggle(isOn: $readyVisible) {
            Text(viewModel.isReadyButtonName)
                .font(.largeTitle)
        }
    }
}

struct TaskView: View {
    @State var taskText = ""
    
    var body: some View {
        Text(taskText)
            .font(.largeTitle)
    }
}

struct TaskListView: View {
    
    @EnvironmentObject var viewModel: TaskListViewModel
    @EnvironmentObject var appState: AppState
    
    @State var readyVisible = false
    
        var body: some View {
            NavigationView {
                List {
                    FilterView(readyVisible: $readyVisible)
                        .environmentObject(viewModel)
                    ForEach(viewModel.tasks) { task in
                        if !self.readyVisible || !task.isReady {
                            NavigationLink(destination: TaskView(taskText: task.isReady ? "Да" : "Нет"),
                                           tag: task.tag,
                                           selection: self.$appState.selectedTaskTag) {
                                Image(systemName: task.isReady ? "checkmark.square" : "square")
                                Text(task.name)
                            }
                        }
                    }
                }
            } // NavigationView
        }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environmentObject(TaskListViewModel())
    }
}
