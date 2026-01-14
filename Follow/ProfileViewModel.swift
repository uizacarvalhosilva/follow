//
//  ProfileViewModel.swift
//  Follow
//
//  Created by Uíza Carvalho on 14/01/26.
//
import Foundation

//CAMADA VIEW MODEL
struct ProfileViewModel{
    
    var isFollowing: Bool = false
    var userFollowers = String()

    var user = User(picture: "pexels",
            name:"Zaiu Wahl",
            nick: "@zaiuwahl",
            followers: 4000)
    
    init(){
        loadFollowers()
    }
    
    mutating func loadFollowers(){
        self.userFollowers = followersFormatted(value: user.followers)
    }
    
    func followersFormatted(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
        
    mutating func toggleFollow(){
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}
