//
//  ProfileView.swift
//  Game Catalogue
//
//  Created by Wanhar on 09/07/20.
//

import SwiftUI
import URLImage

struct ProfileView: View {
    
    @State var email = UserDefaults.standard.value(forKey: EMAIL) as? String ?? "Wanhardaengmaro@gmail.com"
    @State var name = UserDefaults.standard.value(forKey: NAME) as? String ?? "Wanhar"
    @State var isEditing = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    HStack{
                        Spacer()
                        URLImage(URL(string: PHOTO)!) { proxy in
                            proxy.image
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipped()
                                .cornerRadius(150)
                                .shadow(radius: 10)
                        }
                        Spacer()
                    }
                    
                    ZStack(alignment:.topLeading){
                        VStack {
                            VStack(alignment: .leading) {
                                Text("Nama").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                                HStack{
                                    if (isEditing){
                                        TextField("Enter Your Name", text: $name)
                                            .disabled(false)
                                    } else {
                                        TextField("Enter Your Name", text: $name)
                                            .disabled(true)
                                    }
                                }
                                Divider()
                            }.padding(.bottom, 15)
                            
                            VStack(alignment: .leading) {
                                Text("Email").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                                HStack{
                                    if (isEditing){
                                        TextField("Enter Your Email", text: $email)
                                            .disabled(false)
                                    } else {
                                        TextField("Enter Your Email", text: $email)
                                            .disabled(true)
                                    }
                                    
                                }
                                
                                Divider()
                            }.padding(.bottom, 15)
                            
                            Button(action: {
                                if isEditing {
                                    UserDefaults.standard.set(self.name, forKey: NAME)
                                    UserDefaults.standard.set(self.email, forKey: EMAIL)
                                } else {
                                    self.name = UserDefaults.standard.value(forKey: NAME) as? String ?? "Wanhar"
                                    self.email = UserDefaults.standard.value(forKey: EMAIL) as? String ?? "Wanhardaengmaro@gmail.com"
                                }
                                self.isEditing.toggle()
                            }){
                                if isEditing {
                                    Text("Save").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                                } else {
                                    Text("Edit").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                                }
                            }.background(Color.blue)
                            .clipShape(Capsule())
                            .padding(.top, 45)
                        }
                        .padding(30)
                        .background(CustomShape(corner: .allCorners, radii: 30).fill(Color.gray.opacity(0.1)))
                    }.padding(15)
                }
            }
            
            .navigationBarTitle("Profile")
        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
