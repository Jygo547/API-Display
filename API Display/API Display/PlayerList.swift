//
//  PlayerList.swift
//  API Display
//
//  Created by ATLAS Checkout 6 Guest on 9/29/23.
//

import SwiftUI

struct PlayerListView: View {
    @ObservedObject var viewModel = PlayerListViewModel()

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

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}

