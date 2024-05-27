import SwiftUI
import RealityKit
import ARKit



struct ContentView: View {
    @State private var selectedPlanet: PlanetInfo? = nil
    let planetsInfo: [PlanetInfo] = [
        PlanetInfo(modelName: "Astronaut 2.usdz", position: [1.3, 0.3, -0.5], scale: 0.065, description: "This is an astronaut!"),
        PlanetInfo(modelName: "Sun.usdz", position: [0, 0, -2], scale: 0.4, description: "The Sun is the star at the center of our solar system. It is a massive sphere of hot, glowing gases, primarily hydrogen and helium, with a diameter of about 1.4 million kilometers. The Sun provides the essential light and heat necessary for life on Earth."),
        PlanetInfo(modelName: "Mercury_1.usdz", position: [0.5, 0, -0.5], scale: 0.08, description: "Mercury is the smallest planet in our solar system and the closest to the Sun. It is characterized by extreme temperature variations, ranging from scorching hot to freezing cold. With a diameter of about 4,880 kilometers, Mercury has a heavily cratered surface and no substantial atmosphere."),
        PlanetInfo(modelName: "Venus.usdz", position: [-0.4, 0, -0.5], scale: 0.07, description: "Venus is the second planet from the Sun. With a diameter of 12,104 kilometers, it has a thick atmosphere with extreme heat, volcanic activity, acid clouds, and is known as the morning and evening star."),
        PlanetInfo(modelName: "Earth-3.usdz", position: [1, 0, -0.3], scale: 0.15, description: "Earth is the third planet from the Sun and the only known celestial body to support life. It has a diverse environment, with vast oceans, continents, and an atmosphere that sustains life."),
        PlanetInfo(modelName: "Mars-2.usdz", position: [-0.6, 0, -0.35], scale: 0.06, description: "Mars, often called the Red Planet is the fourth planet from the Sun in our solar system. It has diverse surface features, including volcanoes and valleys, making it a target for scientific exploration."),
        PlanetInfo(modelName: "Jupiter.usdz", position: [1.38, 0, 0.3], scale: 0.15, description: "Jupiter, the largest planet in our solar system, is a gas giant known for its iconic banded appearance and the Great Red Spot—a massive storm. It has a strong magnetic field and numerous moons, including the four largest called the Galilean moons."),
        PlanetInfo(modelName: "Saturn1.usdz", position: [-1.3, 0, -0.2], scale: 0.25, description: "Saturn, famous for its majestic rings, is the sixth planet from the Sun. It is a gas giant composed mostly of hydrogen and helium. Saturn has a unique hexagonal storm at its north pole and a vast system of moons, the largest of which is Titan."),
        PlanetInfo(modelName: "Uranus.usdz", position: [0.8, 0, 0.8], scale: 0.13, description: "Uranus, the seventh planet from the Sun, is an ice giant. It has a bluish color due to the presence of methane in its atmosphere. Uranus rotates on its side, giving it a unique appearance among the planets in our solar system."),
        PlanetInfo(modelName: "Neptune.usdz", position: [0.3, 0, 1], scale: 0.08, description: "Neptune, the eighth planet from the Sun, is an icy giant known for its striking blue color. It has a turbulent atmosphere with high-speed winds and large storms, including the famous Great Dark Spot. Neptune has a faint system of rings and a collection of moons, the largest of which is Triton.")
    ]

    var body: some View {
        ZStack {
            ARViewContainer(planetsInfo: planetsInfo, selectedPlanet: $selectedPlanet)
                .edgesIgnoringSafeArea(.all)

            if let selectedPlanet = selectedPlanet {
                VStack {
                    Text(selectedPlanet.description)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple.opacity(0.7))
                        .cornerRadius(10)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple.opacity(0.5), lineWidth: 2)
                        )
                        .padding(10)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
