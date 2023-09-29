//
//  PlayerList.swift
//  API Display
//
//  Created by ATLAS Checkout 6 Guest on 9/29/23.
//

import SwiftUI
struct PlayerListView: View {
    @ObservedObject var viewModel = PlayerListViewModel()
    @State private var searchText = ""
    @State private var searchIsActive = false
    var body: some View {
        NavigationView {
            List(filteredPlayers) { player in
                NavigationLink(destination: PlayerDetailView(player: player)) {
                    Text("\(player.first_name) \(player.last_name)")
                }
            }
            .onAppear {
                viewModel.fetchPlayers()
            }
            .navigationBarTitle("NBA Players")
            .searchable(text: $searchText)
        }
    }
    var filteredPlayers: [Player] {
        if searchText.isEmpty {
            return viewModel.players
        } else {
            return viewModel.players.filter { player in
                let name = "\(player.first_name) \(player.last_name)"
                return name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}









