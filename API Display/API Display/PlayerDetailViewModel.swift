//
//  PlayerDetailViewModel.swift
//  API Display
//
//  Created by ATLAS Checkout 6 Guest on 9/29/23.
//

import Foundation

class PlayerDetailViewModel: ObservableObject {
    var player: Player

    init(player: Player) {
        self.player = player
    }
}

