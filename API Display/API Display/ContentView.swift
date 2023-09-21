import Foundation

struct PlayerResponse: Codable {
    var data: [Player]
    var meta: Meta

    struct Meta: Codable {
        var total_pages: Int
        var current_page: Int
        var next_page: Int
        var per_page: Int
        var total_count: Int
    }
}

struct Player: Codable, Identifiable {
    var id: Int
    var first_name: String
    var last_name: String
    var position: String
    var height_feet: Int?
    var height_inches: Int?
    var weight_pounds: Int?
    var team: Team
}

struct Team: Codable {
    var id: Int
    var abbreviation: String
    var city: String
    var conference: String
    var division: String
    var full_name: String
    var name: String
}

class PlayerViewModel: ObservableObject {
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

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PlayerViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.players) { player in
                NavigationLink(destination: PlayerDetailView(player: player)) {
                    Text("\(player.first_name) \(player.last_name)")
                }
            }
            .onAppear {
                viewModel.fetchPlayers()
            }
            .navigationBarTitle("NBA Players")
        }
    }
}

struct PlayerDetailView: View {
    var player: Player

    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(player.first_name) \(player.last_name)")
                .font(.title)
                .padding(.vertical, 10)
            Text("Position: \(player.position)")
                .font(.headline)
                .padding(.vertical, 5)
            Text("Team: \(player.team.full_name)")
                .font(.headline)
                .padding(.vertical, 5)
            Text("Division: \(player.team.division)")
                .font(.headline)
                .padding(.vertical, 5)
            Text("Conference: \(player.team.conference)")
                .padding(.vertical, 5)
            Text("City: \(player.team.city)")
                .padding(.vertical, 5)
//          Unable to view this: Text("Weight: \(Int(player.weight_pounds ?? 0)) lbs")
        }
        .navigationBarTitle("Player Details")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
