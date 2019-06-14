  //
//  ViewController.swift
//  AppoinApp
//
//  Created by Jeanette Moreno on 5/14/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtUnidad: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    
    var EditConsul:Appoin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let consul = EditConsul {
            txtUnidad.text = consul.consultorio
            txtDireccion.text = consul.direccion
            txtTelefono.text = consul.telefono
            
            
            
        }

    }
    
    @IBAction func btnGuardar(_ sender: Any) {
        
        var newConsul:Appoin?
        if let consul = EditConsul {
            newConsul = consul
        }else{
            newConsul = Appoin(context: context)
        }
        
        newConsul?.consultorio = txtUnidad.text
        newConsul?.direccion = txtDireccion.text
        newConsul?.telefono = txtTelefono.text
        newConsul?.date_save = NSDate() as Date
        do{
            ad.saveContext()
            txtUnidad.text = "" 
            txtDireccion.text = ""
            txtTelefono.text = ""
        }catch{
            print("Cannot save")
        }
    }

   @IBAction func buBack(_ sender: Any) {
       dismiss(animated: true, completion: nil)
        
   }
  }
