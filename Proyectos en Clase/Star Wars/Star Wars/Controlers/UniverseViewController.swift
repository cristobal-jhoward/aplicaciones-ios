//
//  UniverseViewController.swift
//  Star Wars
//
//  Created by master on 15/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

class UniverseViewController: UITableViewController {
    
    let model : StarWarsUniverse
    
    var delegate : UniverseViewControllerDelegate?
    
    init(model: StarWarsUniverse){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = "Star Wars"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Numeo de afiliaciones
        return model.affiliationCount
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Personajes que hay en cada seccion
        return model.characterCount(forAffiliation: getAffiliation(forSection: section))
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // cabecera de cada seccion
        return getAffiliation(forSection: section).rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "StarWarsIdCell"
        
        let char = character(forIndexPath: indexPath)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        //Sincronizacion personaje y celda
        
        cell?.imageView?.image = char.photo
        cell?.textLabel?.text = char.alias
        cell?.detailTextLabel?.text = char.name
        
        return cell!
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Averiguar el personaje
        let char = character(forIndexPath: indexPath)
        
        delegate?.universeViewController(self, didSelectCharacter: char)
        
        // let charVC = CharacterViewController(model: char)
        
        // navigationController?.pushViewController(charVC, animated: true)
        
    }
    
    func getAffiliation(forSection section: Int) -> StarWarsAffiliation {
        var aff: StarWarsAffiliation = .unknown
        
        switch section {
        case 0:
            aff = .galacticEmpire
        case 1:
            aff = .rebelAlliance
        case 2:
            aff = .firstOrder
        case 3:
            aff = .jabbaCriminalEmpire
        default:
            aff = .unknown
        }
        
        return aff
    }
    
    func character(forIndexPath indexPath : IndexPath) -> StarWarsCharacter {
        return model.character(atIndex: indexPath.row, forAffiliation: getAffiliation(forSection: indexPath.section))
    }



}


protocol UniverseViewControllerDelegate {
    
    func universeViewController(_ vc: UniverseViewController, didSelectCharacter character: StarWarsCharacter)
}
