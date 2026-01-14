//
//  ProfileViewModel.swift
//  Follow
//
//  Created by Uíza Carvalho on 14/01/26.
//
import Foundation
import Combine

//CAMADA VIEW MODEL
class ProfileViewModel: ObservableObject{
    
    @Published var isFollowing: Bool = false
    @Published var userFollowers = String()

    var user = User(picture: "pexels",
            name:"Zaiu Wahl",
            nick: "@zaiuwahl",
            followers: 4000)
    
    init(){
        loadFollowers()
    }
    
    func loadFollowers(){
        self.userFollowers = followersFormatted(value: user.followers)
    }
    
    func followersFormatted(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
        
    func toggleFollow(){
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}
