import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    @State private var isActive = false
    
    var body: some View {
        
        NavigationView {
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 230) {
                    ForEach(users) { user in
                        GeometryReader { geometry in
                            NavigationLink(destination:
                                            DetailsView(userItem: user)) {
                                AsyncImage(url: URL(string: user.imageURL)!)
                                    .frame(width: 400, height: 400)
                                    .cornerRadius(50)
                                    .shadow(color: Color.orange.opacity(0.9), radius: 8, x: 0, y: 5)
                                
                            }
                                            .padding()
                                            .background(Color.clear)
                                            .frame(width: 250, height: 200)
                                            .cornerRadius(50)
                                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX-25) / -10), axis: (x: -2, y: 5, z: 0), anchor: .center,
                                                              anchorZ: 0.0,
                                                              perspective: 0.9
                                                              
                                            )
                        }.padding(.top, 350)
                            .padding(.bottom,-300)
                    }
                }
            }
            
            
            .onAppear {
                apiCall().getUsers { (users) in
                    self.users = users
                }
                
            }
            
            .overlay(
                Image("LOGO")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top, 450)
            )
            
            
            .background(
                Image("background")
                //.resizable()
                    .scaledToFill())
            .padding(.top, -100.0)
            .opacity(10.0)
            .padding(.leading, -50)
            .padding(.bottom, -380)
            .onAppear{
                withAnimation(.easeInOut(duration: 10.0)) {
                    //                 self.size = 0.9
                    //               self.opacity = 1.0
                }
            }
            
        }
        
    }
    
    //-----------------------------------------------------------------
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
    
    
    struct DetailsView: View {
        let userItem: User
        
        @State private var showAlert = false
        
        
        var body: some View {
            
            VStack{
                
                
                VStack(alignment: .center) {
                    
                    Image(uiImage: loadImageFromURL(imageURL: userItem.imageURL)!)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(50)
                    
                    Text(userItem.fullName)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    
                    Text("Username: \(userItem.firstName)")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    
                    Text("Lastname: \(userItem.lastName)")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    
                    Text("Title: \(userItem.title)")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    
                    Text("Family: \(userItem.family)")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    
                    NavigationView {
                        VStack {
                            NavigationLink(destination: Text("Family:\(userItem.family)")) {
                                Text("Go to Family")
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color.orange)
                                
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("Family"), message: Text(userItem.family), dismissButton: .default(Text("OK")))
                            }
                        }
                        
                        .onTapGesture {
                            showAlert = true
                        }
                        
                        .navigationBarTitle(" ")
                        .frame(height: 20)
                    }
                    
                    
                    Spacer()
                    
                }
                .foregroundColor(Color.blue)
                .shadow(color:Color.orange.opacity(100), radius: 100)
                
                .padding()
                
                
                
                
                
            }
            .background(
                Image("scr")
                    .resizable()
                    .frame(width: 450, height: 1250)
                    .scaledToFit()
                    .padding(.bottom, 300)
                    .overlay(
                        Image("splash")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding(.top, 650))
            )
            
        }
        
        func loadImageFromURL(imageURL: String) -> UIImage? {
            if let url = URL(string: imageURL) {
                do {
                    let data = try Data(contentsOf: url)
                    return UIImage(data: data)
                } catch {
                    print("Could not load image from URL")
                }
            }
            return nil
        }
    }
    
    
    
    
    struct MyButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .foregroundColor(.white)
                .background(Color.white)
                .cornerRadius(100)
            
        }
        
    }
    
    struct House: Codable {
        let name: String
        let swornMembers: [String]
    }
    
}

