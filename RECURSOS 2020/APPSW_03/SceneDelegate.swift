//
//  SceneDelegate.swift
//  APPSW 01
//
//  Created by Fernando on 07/11/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Crear una window
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        
        // Las windows tienen una propiedad windowScene a la que le meto el valor
        window?.windowScene = windowScene
        
        let leiaUrl = Bundle.main.url(forResource: "leia", withExtension: ".caf")!
        
        let leiaSound = try! Data(contentsOf: leiaUrl)
        
        // Crear una instancia del modelo
        let model = StarWarsCharacter(firstName: "Leia", lastName: "Organa", alias: "Princess Leia", soundData: leiaSound, photo: UIImage(named: "leia.jpg")!, url: URL(string: "https://en.wikipedia.org/wiki/Princess_Leia")!, affiliation: .rebelAlliance)
        
        // Crear un VC
        let vc = CharacterViewController(model: model)
        
        // Empotrarlo en un Navigation
        // Es como una pila en la que se combinan los controladores (uno encima de otro)
        // Generalmente es el controlador principar de una app para iOS
        let nav = UINavigationController(rootViewController: vc)
        
        // Asignar el nav como rootVC  ?.  Porque es una window opcional
        window?.rootViewController = nav
        
        // Hacer visible & key a la window
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

