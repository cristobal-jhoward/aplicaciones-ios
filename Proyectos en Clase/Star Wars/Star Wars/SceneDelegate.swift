//
//  SceneDelegate.swift
//  Star Wars
//
//  Created by master on 23/11/2020.
//  Copyright © 2020 master. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        window?.windowScene = windowScene
        
        do {
            var chars = [StarWarsCharacter]()
            
            let jsonRegular = try loadFromLocalFile(fileName: "regularCharacters.json")
            
            for dict in jsonRegular {
                
                do {
                    let char = try decode(starWarsCharacter: dict)
                    chars.append(char)
                } catch  {
                    print("Error al procesar el JSON")
                }
            }
            
            let jsonForce = try loadFromLocalFile(fileName: "forceSensitives.json")
            
            _ = jsonForce.map () {
                
                do {
                    let char = try decode(forceSensitive: $0)
                    chars.append(char)
                } catch  {
                    print("Error al procesar el JSON")
                }
                
            }
            
            let model = StarWarsUniverse(character: chars )
            
            let uVC = UniverseViewController(model: model)
            
            let uNav = UINavigationController(rootViewController: uVC)
            
            let charVC = CharacterViewController(model: model.character(atIndex: 0, forAffiliation: .galacticEmpire))
            
            let charNav = UINavigationController(rootViewController: charVC)
            
            let splitVC = UISplitViewController()
            
            splitVC.viewControllers = [uNav, charNav]
            
            
            
            uNav.navigationBar.barTintColor = .systemGray6
            
            window?.rootViewController = splitVC
            
            uVC.delegate = charVC
            
            window?.makeKeyAndVisible()
        } catch  {
            
            fatalError("Error while loading JSON")
            
        }
        

        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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

