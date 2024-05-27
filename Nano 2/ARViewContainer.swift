import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    let planetsInfo: [PlanetInfo]
    @Binding var selectedPlanet: PlanetInfo?
    let starsModelName: String = "stars1.usdz" 

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.isLightEstimationEnabled = false
        arView.session.run(configuration)

        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)

        let anchor = AnchorEntity(world: .zero)
        arView.scene.addAnchor(anchor)
        for planetInfo in planetsInfo {
            loadPlanet(anchor: anchor, planetInfo: planetInfo)
        }
        
        
        if let starsEntity = loadStars() {
            anchor.addChild(starsEntity)
        }

        context.coordinator.arView = arView

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    private func loadPlanet(anchor: AnchorEntity, planetInfo: PlanetInfo) {
        do {
            let planetEntity = try ModelEntity.load(named: planetInfo.modelName)
            planetEntity.name = planetInfo.modelName
            planetEntity.scale *= planetInfo.scale
            planetEntity.position = planetInfo.position

            planetEntity.generateCollisionShapes(recursive: true)

            if let availableAnimation = planetEntity.availableAnimations.first {
                planetEntity.playAnimation(availableAnimation.repeat(duration: .infinity))
            }

            anchor.addChild(planetEntity)
        } catch {
        }
    }

    private func loadStars() -> Entity? {
        do {
            let starsEntity = try Entity.load(named: starsModelName)
            starsEntity.position.z = -0.3
            return starsEntity
        } catch {
            return nil
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: ARViewContainer
        weak var arView: ARView?

        init(_ parent: ARViewContainer) {
            self.parent = parent
        }

        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            let tapLocation = gesture.location(in: gesture.view)
            guard let arView = gesture.view as? ARView else { return }
            
            let hitTestResults = arView.hitTest(tapLocation)
            
            var closestPlanet: PlanetInfo?
            var closestDistance: Float = .greatestFiniteMagnitude
            
            if let closestResult = hitTestResults.first {
                let entityPosition = closestResult.position
                
                for entity in parent.planetsInfo {
                    let distance = simd_distance(entityPosition, entity.position)
                    if distance < closestDistance {
                        closestPlanet = entity
                        closestDistance = distance
                    }
                }
            }
            
            parent.selectedPlanet = closestPlanet
        }


    }
}

