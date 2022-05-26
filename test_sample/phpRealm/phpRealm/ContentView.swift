//
//  ContentView.swift
//  phpRealm
//
//  Created by norikatano on 2022/05/23.
//

import Foundation
import SwiftUI

struct ContentView: View {

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
            guard let url: URL = URL(string: "http://reading-sound.ciao.jp/nori_document/get_music.php") else {
                print("invalid URL")
                return
            }

            var urlRequest: URLRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard let data = data else {
                    print("invalid response")
                    return
                }
                do {
                    let decoder: JSONDecoder = JSONDecoder()
                    self.models = try decoder.decode([MusicItem].self, from: data)
                } catch {
                    print(String(describing: error))
                    print(error.localizedDescription)
                }
            }).resume()
        })
    }
}

class MusicItem: Codable, Identifiable {
    var id: String? = ""
    var title: String? = ""
    var author: String? = ""
    var description: String? = ""
    var url: String? = ""
    var time: String? = ""
    var version: String? = ""
}
