//
//  HomeDetailView.swift
//  Game Catalogue
//
//  Created by Wanhar on 08/07/20.
//

import SwiftUI
import URLImage

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = DetailViewModel()
    @State private var readMore = false
    
    let id : Int
    
    init(id: Int) {
        self.id = id
        self.viewModel.getDetail(id: id)
        self.viewModel.checkFavorite(id: id)
    }
    
    func imageURL() -> URL {
        if let url  = self.viewModel.gameDetail.background_image {
            return URL(string: url) ?? URL(string: IMAGE_DEFAULT)!
        } else {
            return URL(string: IMAGE_DEFAULT)!
        }
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ScrollView(.vertical, showsIndicators: false){
                    ZStack(alignment: .top){
                        URLImage(imageURL(), placeholder: { _ in
                            Indicator()
                                .frame(height: 320)
                        }) { proxy in
                            proxy.image
                                .resizable()
                                .frame(height: 320)
                        }
                        HStack{
                            Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.white)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 12)
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                            }
                            .padding(.leading, 15)
                            .padding(.top, 40)
                            
                            Spacer()
                            
                            if self.viewModel.isFavorite {
                                Button(action: {
                                    self.viewModel.deleteGame(id: self.viewModel.gameDetail.id)
                                }){
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.red)
                                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 12)
                                        .background(Color.white)
                                    
                                }.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.top, 40)
                                .padding(.trailing, 15)
                            } else {
                                Button(action: {
                                    self.viewModel.saveGame(id: self.viewModel.gameDetail.id,
                                                            name: self.viewModel.gameDetail.name,
                                                            image: self.viewModel.gameDetail.background_image ?? "",
                                                            ranking: self.viewModel.gameDetail.rating_top,
                                                            rating: self.viewModel.gameDetail.rating ?? 0.0,
                                                            released:  self.viewModel.gameDetail.released ?? "")
                                }){
                                    Image(systemName: "suit.heart")
                                        .foregroundColor(.red)
                                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 12)
                                        .background(Color.white)
                                    
                                }.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.top, 40)
                                .padding(.trailing, 15)
                            }
                        }
                    }.clipShape(CustomShape(corner: .bottomLeft, radii: 35))
                    
                    HStack {
                        Text(self.viewModel.gameDetail.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                        
                    }.padding(.horizontal, 25)
                    .padding(.top,25)
                    
                    HStack {
                        VStack() {
                            Text("Released")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(self.viewModel.gameDetail.released ?? "")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top,8)
                        }
                        Spacer()
                        VStack {
                            Text("Rating")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(String(format: "%.02f", Double(self.viewModel.gameDetail.rating ?? 0.0)))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top,8)
                        }
                        Spacer()
                        VStack {
                            Text("Ranking")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(String("\(self.viewModel.gameDetail.rating_top)"))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top,8)
                        }
                    }.padding(.horizontal, 25)
                    .padding(.top,20)
                    
                    HStack {
                        VStack{
                            HStack{
                                Text("Website").font(.headline)
                                Spacer()
                            }
                            HStack{
                                Text(self.viewModel.gameDetail.website ?? "")
                                    .foregroundColor(Color.blue)
                                    .padding(.top,10)
                                Spacer()
                            }
                        }
                    }.padding(.horizontal, 25)
                    .padding(.top,20)
                    
                    HStack(){
                        VStack(alignment: .leading){
                            HStack{
                                Text("Description").font(.headline)
                                Spacer()
                            }
                            if(readMore){
                                Text(self.viewModel.gameDetail.description_raw)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .padding(.top,10)
                            } else {
                                Text(self.viewModel.gameDetail.description_raw)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top,10)
                                    .lineLimit(5)
                            }
                            Button(action: {self.readMore.toggle()}, label: {
                                if self.readMore{
                                    Text("")
                                } else {
                                    Text("Read more")
                                }
                            })
                        }
                    }.padding(.horizontal, 25)
                    .padding(.top,20)
                    
                    HStack(alignment:.top,spacing: 2) {
                        VStack(alignment:.leading) {
                            if self.viewModel.gameDetail.genres != nil {
                                Text("Genres").font(.headline)
                                ForEach(self.viewModel.gameDetail.genres!, id: \.id){ genre in
                                    Text(genre.name)
                                        .font(.subheadline)
                                    
                                }
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment:.leading) {
                            if (self.viewModel.gameDetail.tags != nil) {
                                Text("Developers").font(.headline)
                                ForEach(self.viewModel.gameDetail.developers!, id: \.id){ tag in
                                    Text(tag.name)
                                        .font(.subheadline)
                                }
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment:.leading) {
                            if (self.viewModel.gameDetail.tags != nil) {
                                Text("Tags").font(.headline)
                                ForEach(self.viewModel.gameDetail.tags!, id: \.id){ tag in
                                    Text(tag.name)
                                        .font(.subheadline)
                                }
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }.padding(.horizontal, 25)
                    .padding(.top,20)
                }
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
        .animation(.default)
        .navigationBarHidden(true)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 0)
    }
}
