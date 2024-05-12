//
//  FavCharViewController.swift
//  MarvelApp
//
//  Created by Abraham Valderrabano Vega on 10/05/24.
//

import UIKit

class FavCharViewController: UITableViewController {
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    @IBOutlet var charatersList: UITableView!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var myFavoriteCharacters: [FavoriteChar] = []
    var charToDelete: FavoriteChar?
    
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        if charatersList.isEditing {
            charatersList.setEditing(false, animated: true)
            sender.title = "Edit"
        }else{
            charatersList.setEditing(true, animated: true)
            sender.title = "Done"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        charatersList.delegate = self
        charatersList.dataSource = self
        let charManager = CharManager(context: context)
        myFavoriteCharacters = charManager.getAllCharacters()
        charatersList.reloadData()
       
        if myFavoriteCharacters.isEmpty {
            editButton.isHidden = true
        }else{
            editButton.isHidden = false
        }
        
    
        for persistentChar in myFavoriteCharacters{
            print("ID: ", persistentChar.charId ?? "0000", "name: ", persistentChar.name ?? "No name", "description: ",persistentChar.descriptionChar ?? "No description", "resourceURI: ", persistentChar.resourceURI ?? "No resourceURI", "thumbnail: ", persistentChar.thumbnail ?? "No thumbnail")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
    
            self.tableView.reloadData()
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favCharSegue" {
            let charManager = CharManager(context: context)
            
            if let navigationController = segue.destination as? UINavigationController {
               
                if let destination = navigationController.topViewController as? CharSelectedViewController {
                  
                    if let indexPath = self.tableView.indexPathForSelectedRow {
                        let charSelected = charManager.getCharacter(index: indexPath.row)!
                        destination.favCharacter = charSelected
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let charManager = CharManager(context: context)
        return charManager.getAllCharacters().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let charManager = CharManager(context: context)
        if charManager.getAllCharacters().isEmpty {
            editButton.isHidden = true
        }else{
            editButton.isHidden = false
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CharFavoriteCell
        cell?.charName.text = charManager.getCharacter(index: indexPath.row)?.name
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let charManager = CharManager(context: context)

        let alertController = UIAlertController(title: "Confirmation", message: "Are you sure to delete this character?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
              
                if editingStyle == .delete {
                    
                   
                    if let charDelete = charManager.getCharacter(index: indexPath.row) {
                        let result = charManager.deleteCharacter(char: charDelete)
                        if result == true{
                            print("Character was deleted")
                        }else{
                            print("Character was not located!")
                        }
                    }
                    self.tableView.reloadData()
                    if charManager.getAllCharacters().isEmpty {
                 
                        self.charatersList.setEditing(false, animated: true)
                        self.editButton.title = "Edit"
                        self.editButton.isHidden = true
                    }else{
                        self.editButton.isHidden = false
                    }
                }
            }
            alertController.addAction(confirmAction)
            
         
            present(alertController, animated: true, completion: nil)
        
        
    }
    
    
}
