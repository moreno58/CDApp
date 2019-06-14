//
//  VCModel.swift
//  AppoinApp
//
//  Created by Jeanette Moreno on 6/11/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit

class VCModel: UIViewController {


    @IBOutlet weak var txtEscuela: UITextField!
    @IBOutlet weak var txtDire: UITextField!
    @IBOutlet weak var txtTel: UITextField!
    
    var EditCollages:Entity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let collages = EditCollages {
            txtEscuela.text = collages.name
            txtDire.text = collages.direcc
            txtTel.text = collages.telefo
            
            
            
        }
        
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
   
        
        var newCollag:Entity?
        if let collag = EditCollages {
            newCollag = collag
        }else{
            newCollag = Entity(context: context)
        }
        
        newCollag?.name = txtEscuela.text
        newCollag?.direcc = txtDire.text
        newCollag?.telefo = txtTel.text
        newCollag?.date = NSDate() as Date
        do{
            ad.saveContext()
            txtEscuela.text = ""
            txtDire.text = ""
            txtTel.text = ""
        }catch{
            print("Cannot save")
        }
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
}
