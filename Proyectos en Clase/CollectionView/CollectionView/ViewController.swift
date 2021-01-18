//
//  ViewController.swift
//  CollectionView
//
//  Created by master on 18/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let fotos : [UIImage] = [#imageLiteral(resourceName: "imgRoma"), #imageLiteral(resourceName: "imgLima"), #imageLiteral(resourceName: "imgSucre"), #imageLiteral(resourceName: "imgParis"), #imageLiteral(resourceName: "imgOttawa"), #imageLiteral(resourceName: "imgLisboa"), #imageLiteral(resourceName: "imgBerlin"), #imageLiteral(resourceName: "imgBogota"), #imageLiteral(resourceName: "imgBrasilia"), #imageLiteral(resourceName: "imgAtenas"), #imageLiteral(resourceName: "imgLaHabana"), #imageLiteral(resourceName: "imgMadrid"), #imageLiteral(resourceName: "imgBuenosAires"), #imageLiteral(resourceName: "imgGinebra"), #imageLiteral(resourceName: "imgWashington"), #imageLiteral(resourceName: "imgBudapest")]
    
    
    let ciudades = ["Roma","Lima","Sucre","París","Ottawa", "Lisboa","Berlín","Bogotá","Brasilia","Atenas","La Habana","Madrid","Brasilia","Atenas","La Habana", "Madrid","Buenos Aires","Ginebra","Washington","Budapest"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fotos.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
    
    cell.imagen.image = fotos[indexPath.item]
    cell.etiqueta.text = ciudades[indexPath.item]
    
    return cell
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = sb.instantiateViewController(identifier: "viewDos") as SegundoViewController
        
        vc.datosQueLlegan = fotos[indexPath.item]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

