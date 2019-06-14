//
//  TVCAppoin.swift
//  AppoinApp
//
//  Created by Jeanette Moreno on 5/14/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit

class TVCAppoin: UITableViewCell {
    

    @IBOutlet weak var buDelete: UIButton!
    
    @IBOutlet weak var buedit: UIButton!
    
    
    @IBOutlet weak var laUnidad: UILabel!
    @IBOutlet weak var laDireccion: UILabel!
    @IBOutlet weak var laTelefono: UILabel!
    @IBOutlet weak var laDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func SetConsul(consul: Appoin){
        laUnidad.text = consul.consultorio
        laDireccion.text = consul.direccion
        laTelefono.text = consul.telefono
        
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yy h:mm a"
        let now = dateFormat.string(from: consul.date_save as! Date)
        laDate.text = now
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
