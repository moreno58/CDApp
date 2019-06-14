//
//  TVCColleges.swift
//  AppoinApp
//
//  Created by Jeanette Moreno on 5/20/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit

class TVCColleges: UITableViewCell {


    @IBOutlet weak var btnEditar: UIButton!
    @IBOutlet weak var btnEliminar: UIButton!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDireccion: UILabel!
    @IBOutlet weak var lblTelefono: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func SetCollages(collag: Entity){
        lblName.text = collag.name
        lblDireccion.text = collag.direcc
        lblTelefono.text = collag.telefo
        
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yy h:mm a"
        let now = dateFormat.string(from: collag.date as! Date)
        lblDate.text = now
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
