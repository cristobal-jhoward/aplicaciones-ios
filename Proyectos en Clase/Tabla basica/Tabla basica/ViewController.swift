//
//  ViewController.swift
//  Tabla basica
//
//  Created by master on 14/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    
    @IBOutlet weak var table: UITableView!
    
    
    var array = [
        ["Nombre": "Luis", "Edad": "45", "Profesión": "Arquitecto"],
        ["Nombre": "Rosa", "Edad": "27", "Profesión": "Diseñadora"],
        ["Nombre": "Andres", "Edad": "18", "Profesión": "Estudiante"],
        ["Nombre": "Elena", "Edad": "28", "Profesión": "Abogada"],
        ["Nombre": "Laura", "Edad": "22", "Profesión": "Estudiante"],
        ["Nombre": "Alfredo", "Edad": "44", "Profesión": "Notario"],
        ["Nombre": "Fernando", "Edad": "57", "Profesión": "Profesor"],
        ["Nombre": "Maribel", "Edad": "33", "Profesión": "Medico"],
        ["Nombre": "Pedro", "Edad": "45", "Profesión": "Bombero"]
    ]
    
    var selectedLabel = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tabla básica"
        
        let alertController = UIAlertController(title: title, message: "Bienvenidos a esta clase de Apps en el master del IFAB de Bellas Artes", preferredStyle: .alert)
        
        let OKAction = UIAlertAction.init(title: "OK", style: .default) { ACTION in
            print("OK Pulsado")
        }
        
        alertController.addAction(OKAction)
        
        present(alertController, animated: true, completion: nil)
    }

    
    // METODOS DEL PROTOCOLO
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = array[indexPath.row]["Nombre"]
        cell?.detailTextLabel?.text = array[indexPath.row]["Edad"]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print("He seleccionado \(selectedLabel) y he clickeado en la celda \(indexPath.row)")
        
        selectedLabel = array[indexPath.row]["Profesión"]!
        
        let vistaDos = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewDos") as! SegundoViewController
        
        vistaDos.textoRecibido = selectedLabel
        
        navigationController?.pushViewController(vistaDos, animated: true)
        
    }

}

