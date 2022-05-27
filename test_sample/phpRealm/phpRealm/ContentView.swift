//
//  ContentView.swift
//  phpRealm
//
//  Created by norikatano on 2022/05/23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var requestMusicItems = RequestMusicItems()
    @State var models: [MusicItem] = []

    var body: some View {
        VStack {

            List (self.models) { (model) in
                HStack {
                    Text(model.title ?? "")
                    Text(model.author ?? "").font(.callout)
                }
            }
        }.onAppear(perform: {
            self.models = requestMusicItems.models
        })
    }
}
