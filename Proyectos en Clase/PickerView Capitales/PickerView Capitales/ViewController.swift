//
//  ViewController.swift
//  PickerView Capitales
//
//  Created by master on 08/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var fila : Int = 0;
  
    
    
    var modelo : Ciudades = ciudadesEU
    
    @IBOutlet weak var capitaldelPais: UILabel!
    
    @IBOutlet weak var imagenCapital: UIImageView!
    
    @IBOutlet weak var estadoSwitch: UISwitch!
    
    @IBOutlet weak var miPickerView: UIPickerView!
    
    @IBAction func botonSwitch(_ sender: UISwitch) {
        
        if estadoSwitch.isOn{
            
            modelo = ciudadesEU
        }else{
            
            modelo = ciudadesAM
        }
        
        miPickerView.reloadAllComponents()
        
         
         sincronizarVistaModelo(model: modelo, index: fila)
    }
    
    
    //DATASOURCE
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelo.numeroCiudades()
      }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        miPickerView.reloadAllComponents()
       
        
        sincronizarVistaModelo(model: modelo, index: fila)
    }
    
    func sincronizarVistaModelo(model: Ciudades, index: Int){
        
        title = modelo.nombre
        let localidad = modelo.ciudad(atIndex: index)
        capitaldelPais.text = localidad.capital
        imagenCapital.image = localidad.foto
        fila = index
    }
    
    //DELEGATE
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modelo.ciudad(atIndex: row).pais
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sincronizarVistaModelo(model: modelo, index: row)
    }


}

