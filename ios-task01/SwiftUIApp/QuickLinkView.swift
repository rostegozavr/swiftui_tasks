//
//  QuickLinkView.swift
//  SwiftUIApp
//
//  Created by Rostislav Permyakov on 08.03.2020.
//  Copyright © 2020. All rights reserved.
//

import SwiftUI

struct QuickLinkView: View {
    
    @EnvironmentObject var viewModel: QuickLinkViewModel
    
    var body: some View {
        Button(action: {
            AppState.shared.setSelectedTab(.taskListTab, taskTag: "bread")
        }, label: {
            Text(viewModel.quickButtonName)
        })
    }
}

final class QuickLinkViewModel: ObservableObject {
    
    @Published private(set) var quickButtonName = "Хлеб нужен?"

}

struct QuickLinkView_Previews: PreviewProvider {
    static var previews: some View {
        QuickLinkView()
    }
}
