//
//  ViewController.swift
//  Write
//
//  Created by Zulwiyoza Putra on 10/14/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    

    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    var note: Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            
            let listNotesTableViewController = segue.destination as! ListNotesTableViewController
            
            if identifier == "Cancel" {
                
                print("Cancel button tapped")
                
            } else if identifier == "Save" {
                
                print("Save button tapped")
                
                if let note = note {
                    note.title = noteTitleTextField.text ?? ""
                    note.content = noteContentTextView.text ?? ""
                    note.modificationTime = NSDate()
                    listNotesTableViewController.tableView.reloadData()
                } else {
                    let newNote = Note()
                    newNote.title = noteTitleTextField.text ?? ""
                    newNote.content = noteContentTextView.text ?? ""
                    newNote.modificationTime = NSDate()
                    listNotesTableViewController.notes.append(newNote)
                }
            }
        }
    }


}

