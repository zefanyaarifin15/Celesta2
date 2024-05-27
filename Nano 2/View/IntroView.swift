import SwiftUI

struct IntroView: View {
    @State private var animateText = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("celestabg") 
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Text("Welcome to Celesta")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .opacity(animateText ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.0)) {
                                self.animateText = true
                            }
                        }
                    
                    Text("Your journey through the stars begins here.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.white)
                        .opacity(animateText ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.0)) {
                                self.animateText = true
                            }
                        }
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Start Exploring")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .opacity(animateText ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.0)) {
                                    self.animateText = true
                                }
                            }
                    }
                    .padding()
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
