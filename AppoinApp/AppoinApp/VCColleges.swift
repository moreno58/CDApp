//
//  VCColleges.swift
//  AppoinApp
//
//  Created by Jeanette Moreno on 6/11/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit
import CoreData

class VCColleges: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tvcCollages: UITableView!
    
    var listCollages = [Entity]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCollag()
        tvcCollages.delegate = self
        tvcCollages.dataSource = self
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCollages.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCColleges = tableView.dequeueReusableCell(withIdentifier: "CellUni", for:indexPath) as! TVCColleges
        cell.SetCollages(collag: listCollages[indexPath.row])
        cell.btnEliminar.tag = indexPath.row
        cell.btnEditar.addTarget(self, action: #selector(buDeletePress(_:)), for: .touchUpInside)
        
        cell.btnEditar.tag = indexPath.row
        cell.btnEditar.addTarget(self, action: #selector(buEditPress(_:)), for: .touchUpInside)
        
        return cell
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit"{
            if let AddOREdit = segue.destination as? VCModel{
                if let mycollag = sender as? Entity{
                    AddOREdit.EditCollages = mycollag
                    tvcCollages.reloadData()
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
  //  @IBAction func btnAdd(_ sender: Any) {
      //  performSegue(withIdentifier: "Edit", sender: nil)
        
        
   // }
    
    @objc func buDeletePress(_ sender:UIButton){
        print("index \(sender.tag)")
        context.delete(listCollages[sender.tag])
        loadCollag()
    }
    
    @objc func buEditPress(_ sender:UIButton){
        performSegue(withIdentifier: "Edit", sender: listCollages[sender.tag])
        loadCollag()
        
    }
    
    func loadCollag(){
        let fetchRequest:NSFetchRequest<Entity> = Entity.fetchRequest()
        do{
            listCollages = try context.fetch(fetchRequest)
            tvcCollages.reloadData()
        }catch{
            print("cannot read from database")
        }
    }
    
    
}
