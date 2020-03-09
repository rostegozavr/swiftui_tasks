//
//  AboutView.swift
//  SwiftUIApp
//
//  Created by Rostislav Permyakov on 08.03.2020.
//  Copyright © 2020. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    @State var aboutShowed: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.aboutShowed.toggle()
            }) {
                Text("Описание программы")
            }
        }
        .sheet(isPresented: $aboutShowed, onDismiss: { print("Модальное окно закрыто...") }) {
            AboutViewModal()
        }
    }
}

struct AboutViewModal: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Spacer()
            Text("Список продуктов. Самое главное - не забыть купить хлеб!")
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Закрыть")
            }
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

