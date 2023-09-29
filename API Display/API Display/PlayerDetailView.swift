//
//  PlayerDetail View.swift
//  API Display
//
//  Created by ATLAS Checkout 6 Guest on 9/29/23.
//

import SwiftUI

struct PlayerDetailView: View {
    @ObservedObject var viewModel: PlayerDetailViewModel

    init(player: Player) {
        viewModel = PlayerDetailViewModel(player: player)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(viewModel.player.first_name) \(viewModel.player.last_name)")
                .font(.title)
                .padding(.vertical, 10)
            Text("Position: \(viewModel.player.position)")
                .font(.headline)
                .padding(.vertical, 5)
            Text("Team: \(viewModel.player.team.full_name)")
                .font(.headline)
                .padding(.vertical, 5)
            Text("Division: \(viewModel.player.team.division)")
                .font(.headline)
                .padding(.vertical, 5)
            Text("Conference: \(viewModel.player.team.conference)")
                .padding(.vertical, 5)
            Text("City: \(viewModel.player.team.city)")
                .padding(.vertical, 5)
            Text("Height: \(Int(viewModel.player.height_feet ?? 0)) feet \(Int(viewModel.player.height_inches ?? 0)) inches")
                .padding(.vertical, 5)
            Text("Weight: \(Int(viewModel.player.weight_pounds ?? 0)) lbs")
        }
        .navigationBarTitle("Player Details")
    }
}

struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let player = Player(
            id: 237,
            first_name: "LeBron",
            last_name: "James",
            position: "F",
            height_feet: 6,
            height_inches: 8,
            weight_pounds: 250,
            team: Team(
                id: 14,
                abbreviation: "LAL",
                city: "Los Angeles",
                conference: "West",
                division: "Pacific",
                full_name: "Los Angeles Lakers",
                name: "Lakers"
            )
        )
        return PlayerDetailView(player: player)
    }
}
