//
//  SceneDelegate.swift
//  CompLayout
//
//  Created by Alex on 23/09/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        configureCards(with: windowScene)
    }
}

private extension SceneDelegate {
    func configureCards(with scene: UIWindowScene) {
        let vm = CardsViewModel()
        let vc = CardsViewController(viewModel: vm)
        
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

