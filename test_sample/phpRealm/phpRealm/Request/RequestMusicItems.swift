//
//  requestMusicItems.swift
//  phpRealm
//
//  Created by norikatano on 2022/05/26.
//

import Foundation

class RequestMusicItems: ObservableObject {

    public var models: [MusicItem] = []

    init(){
        featchData()
    }

    func featchData() {
        let semaphore = DispatchSemaphore(value: 0)

        let url: URL = URL(string: "http://reading-sound.ciao.jp/nori_document/get_music.php")!

        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            guard let data = data else {
                print("invalid response")
                return
            }
            print(data)
            do {
                let decoder: JSONDecoder = JSONDecoder()
                self.models = try decoder.decode([MusicItem].self, from: data)
                semaphore.signal()
            } catch {
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }).resume()
        semaphore.wait()
    }

}
