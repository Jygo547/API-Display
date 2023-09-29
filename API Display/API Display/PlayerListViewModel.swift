//
//  PlayerListViewModel.swift
//  API Display
//
//  Created by ATLAS Checkout 6 Guest on 9/29/23.
//

import Foundation

class PlayerListViewModel: ObservableObject {
    @Published var players: [Player] = []

    func fetchPlayers() {
        if let url = URL(string: "https://www.balldontlie.io/api/v1/players") {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(PlayerResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.players = decodedData.data
                        }
                    } catch {
                        print("Error decoding data: \(error)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error)")
                }
            }.resume()
        }
    }
}

