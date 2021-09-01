//
//  BoardingScreen.swift
//  OnBoardingAnimation0901
//
//  Created by 张亚飞 on 2021/9/1.
//

import SwiftUI

struct BoardingScreen: Identifiable {
    
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

//
var title = "Easy Payments with \nWalletory"
var description = "Small business can receive device \npayment super fast and super easy"



//Sample model screens...
var boardingScreens: [BoardingScreen] = [

    BoardingScreen(image: "screen1", title: title, description: description),
    BoardingScreen(image: "screen2", title: title, description: description),
    BoardingScreen(image: "screen3", title: title, description: description),
    BoardingScreen(image: "screen4", title: title, description: description)
]
