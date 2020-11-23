//
//  SceneDelegate.swift
//  starwars
//
//  Created by Fernando on 16/06/2020.
//  Copyright © 2020 Fernando. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Crear una window
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        // Las windows tienen una propiedad windowScene a la que le meto el valor
        window?.windowScene = windowScene
        
        do {
            
            // Creo un array vacío de personajes
            var chars = [StarWarsCharacter]()
            
            // Array de Diccionarios de Swift, pero yo necesito para el model un array de StarWarsCharacter.
            let jsonRegular  = try loadFromLocalFile(fileName: "regularCharacters.json")
            
            for dict in jsonRegular{
                do{
                    let char = try decode(starWarsCharacter: dict)
                    chars.append(char)
                }catch{
                    print("Error al procesar \(dict)")
                }
            }
            
            // Arrays de Diccionarios de Swift (de ForceSensitives)
            
            let jsonForce  = try loadFromLocalFile(fileName: "forceSensitives.json")
            
            // Es lo mismo que el for de arriba
            
            _ = jsonForce.map() {
                do{
                    let char = try decode(forceSensitive: $0)
                    chars.append(char)
                }catch{
                    print("Error al procesar \($0)")
                }
            }
            
            //print(chars)
            
            // Crear una instancia del modelo
            let model = StarWarsUniverse(characters: chars)
            
            // Crear un UniverseVC
            let uVC  = UniverseViewController(model: model)
            
            // Empotrando en un Navigation
            let uNav = UINavigationController(rootViewController: uVC)
            
            // Una vez puesto esto lo probamos:
            // Con SplitViewController no tendremos que hacer un PUSH sino que actualizaremos la vista de la derecha. Para ello hay que enviar información de un controlador al otro (de UniverVC a CharacterVC). Para ello uraremos el patrón del delegado
            
            // Creamos un Character VC (pongo un cualquiera: el 1º de los imperiales)
            let charVC = CharacterViewController(model: model.character(atIndex: 0, forAffiliation: .galacticEmpire))
            
            // Lo metemos en otro Navigation
            let charNav = UINavigationController(rootViewController: charVC)
            
            // Creamos un SplitView y le endosamos los dos navs. Los  splits tienen una propiedad que recibe un array de viewControllers
            
            let splitVC = UISplitViewController()
            
            splitVC.viewControllers = [uNav, charNav]
            
            // Asignar el nav como rootVC  ?.  Porque es una window opcional
            window?.rootViewController = splitVC
            
            // Asignamos delegados.
            // Le decimos a uVC (UniverseViewController): éste, charVC (CharacterViewController), es tu delegado. Entonces  CharacterViewController tendrá que implementar el protocolo de delegado y así cuando reciba el nuevo modelo tendrá que actualizarse
                
            uVC.delegate = charVC
            
            // Hacer visible & key a la window
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

