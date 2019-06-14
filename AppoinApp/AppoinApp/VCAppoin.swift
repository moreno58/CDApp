 //
//  VCAppoin.swift
//  AppoinApp
//
//  Created by Jeanette Moreno on 5/14/19.
//  Copyright © 2019 Jeanette. All rights reserved.
//

import UIKit
 import CoreData

class VCAppoin: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var listConsul = [Appoin]()
    
    
    @IBOutlet weak var tvConsulList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadConsul()
        tvConsulList.delegate = self
        tvConsulList.dataSource = self
        
        
    }
   
    
  func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return listConsul.count
        
   }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCAppoin = tableView.dequeueReusableCell(withIdentifier: "CellConsult", for:indexPath) as! TVCAppoin
        cell.SetConsul(consul: listConsul[indexPath.row])
        cell.buDelete.tag = indexPath.row
        cell.buDelete.addTarget(self, action: #selector(buDeletePress(_:)), for: .touchUpInside)
        
        cell.buedit.tag = indexPath.row
        cell.buedit.addTarget(self, action: #selector(buEditPress(_:)), for: .touchUpInside)
      
        return cell
       
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Editor"{
            if let AddOREdit = segue.destination as? ViewController{
                if let myconsul = sender as? Appoin{
                    AddOREdit.EditConsul = myconsul
                    tvConsulList.reloadData()
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
   // @IBAction func Agregar(_ sender: Any) {
    //    performSegue(withIdentifier: "Editor", sender: nil)
   // }
    
    
    @objc func buDeletePress(_ sender:UIButton){
        print("index \(sender.tag)")
        context.delete(listConsul[sender.tag])
        loadConsul()
    }
    
    @objc func buEditPress(_ sender:UIButton){
        performSegue(withIdentifier: "Editor", sender: listConsul[sender.tag])
        loadConsul()
        
    }
    
    func loadConsul(){
        let fetchRequest:NSFetchRequest<Appoin> = Appoin.fetchRequest()
        do{
            listConsul = try context.fetch(fetchRequest)
            tvConsulList.reloadData()
        }catch{
            print("cannot read from database")
        }
    }


}
