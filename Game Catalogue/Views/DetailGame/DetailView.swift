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
    
    
    @State var item : Game
    @State private var selection = 0
    
    var body: some View {
        
        //        List {
        //            ZStack {
        //                Rectangle()
        //                    .fill(Color.gray)
        //
        //                URLImage((URL(string: item.background_image ?? NO_IMAGE)!), placeholder: { _ in
        //                    Text("Loading...")
        //                }) { proxy in
        //                    proxy.image
        //                        .resizable()
        //                }
        //
        //            }.aspectRatio(16/9, contentMode: .fit)
        //
        //            HStack {
        //                Text("Release : ")
        //                    .font(.headline)
        //                if (item.released != nil){
        //                    Text(item.released ?? "")
        //                        .font(.subheadline)
        //                }
        //            }.frame(alignment: .leading)
        //
        //            HStack {
        //                Text("Rating : ")
        //                    .font(.headline)
        //                Text(String("\(item.rating)"))
        //                    .font(.subheadline)
        //            }.frame(alignment: .leading)
        //
        //            HStack {
        //                Text("Ranking rating top : ")
        //                    .font(.headline)
        //                Text(String("\(item.rating_top)"))
        //                    .font(.subheadline)
        //            }.frame(alignment: .leading)
        //
        //            HStack(alignment:.top,spacing: 2) {
        //                VStack(alignment:.leading) {
        //                    if item.genres != nil {
        //                        Text("Genres").font(.headline)
        //                        ForEach(item.genres!, id: \.id){ genre in
        //                            Text(genre.name)
        //                                .font(.subheadline)
        //
        //                        }
        //                    }
        //                }
        //                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        //                Spacer()
        //                VStack(alignment:.leading) {
        //                    if (item.tags != nil) {
        //                        Text("Tags").font(.headline)
        //                        ForEach(item.tags!, id: \.id){ tag in
        //                            Text(tag.name)
        //                                .font(.subheadline)
        //                        }
        //                    }
        //                }
        //            }.padding(.top, 15)
        //
        //        }
        //        .navigationBarTitle(item.name)
        
        VStack {
            
            ZStack(alignment: .top){
                URLImage((URL(string: item.background_image ?? IMAGE_DEFAULT)!), placeholder: { _ in
                    Image(IMAGE_DEFAULT)
                        .resizable()
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
                            self.viewModel.saveTodo(id: item.id, name: item.name, image: item.background_image ?? "", ranking: item.rating_top, rating: item.rating ?? 0.0)
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
                Text(item.name)
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
                    Text(item.released ?? "")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                Spacer()
                VStack {
                    Text("Rating")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(String("\(item.rating)"))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                Spacer()
                VStack {
                    Text("Ranking")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(String("\(item.rating_top)"))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }.padding(.horizontal, 25)
            .padding(.top,25)
            
            if self.item.screenshots != nil {
                VStack {
                    HStack{
                        Text("Screenshots")
                            .font(.system(size:20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    ScrollView(.horizontal,showsIndicators:false){
                        HStack {
                            ForEach(self.item.screenshots!, id: \.id){ ss in
                                PictureGameItem(imageURL: ss.image)
                            }
                        }.padding([.leading,.trailing],18)
                    }
                }.padding(.horizontal, 25)
                .padding(.top,25)
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
        DetailView(item: dummyGame)
    }
}
