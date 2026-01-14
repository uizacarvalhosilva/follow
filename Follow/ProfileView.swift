//
//  ContentView.swift
//  Follow
//
//  Created by Uíza Carvalho on 14/01/26.
//

import SwiftUI

//CAMADA VIEW
struct ProfileView: View {
    
    // O state na frente de uma propriedade, criamos uma fonte da verdade. Quando é detectado que houve alteração no body a atualizaçao da propriedade é realizada, forcando que a view seja reconstruída automaticamente. Ele detecta se será feito em um trecho específico ou se é em toda view (muito bom)
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
        VStack {
            ProfileDataView(viewModel: viewModel)
            ActionView(viewModel: viewModel)
        }
    }
}

struct ProfileDataView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        //Perfil
        Image(viewModel.user.picture)
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .shadow(radius: 30)

        Text(viewModel.user.name)
            .font(.system(size: 50, weight: .bold))
        
        Text(viewModel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundStyle(Color.gray)
        
        Text(viewModel.userFollowers)
            .font(.system(size: 80,weight: .light))
            .padding(40)
    }
}

struct ActionView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack{
            //Seguir
            Button{viewModel.toggleFollow()} label: {
                Label(!viewModel.isFollowing ? "Follow" : "Unfollow",systemImage: "heart.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .black)
            
            //Enviar mensagem
            Button{} label: {
                Label("Send message",systemImage:"ellipsis.message.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }
        .padding(20)
    }
}

#Preview {
    ProfileView()
}
