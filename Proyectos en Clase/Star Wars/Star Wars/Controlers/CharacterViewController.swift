//
//  CharacterViewController.swift
//  Star Wars
//
//  Created by master on 17/12/2020.
//  Copyright © 2020 master. All rights reserved.
//

import UIKit
import AVFoundation

class CharacterViewController: UIViewController {
    
    
    var model: StarWarsCharacter;
    var player = AVAudioPlayer()

    @IBOutlet weak var photoView: UIImageView!
    
    init(model: StarWarsCharacter){
        
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncModelWithView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playSound(_ sender: Any) {
        
        //print("Se oye hablar al personaje")
        
        player.play()
    }
    
    func syncModelWithView(){
        
        photoView.image = model.photo
        
        title = model.name
        
        do {
            try player = AVAudioPlayer(data: model.soundData)
        } catch  {
            print("Ha habido un error")
        }
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func displayWiki(_ sender: Any) {
        
        print("Se abre la Wiki del personaje")
    }
    

}
