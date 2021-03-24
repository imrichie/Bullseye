//
//  Game.swift
//  Bullseye
//
//  Created by Richie Flores on 1/13/21.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    //MARK: - Properties
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        for _ in 1...5 {
            leaderboardEntries.append(LeaderboardEntry(score: Int.random(in: 1...100), date: Date()))
        }
    }
    
    //MARK: - Methods
    func points(sliderValue: Int) -> Int {
        var points: Int = 100 - abs(target - sliderValue)
        
        if sliderValue == target {
            points += 100
        } else if abs(target - sliderValue) <= 2 {
            points += 50
        }
        return points
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
}
