import SwiftUI


struct PlanetInfo: Identifiable {
    var id = UUID()
    var modelName: String
    var position: SIMD3<Float>
    var scale: Float
    var description: String
}
