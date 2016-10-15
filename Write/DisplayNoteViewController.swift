//
//  ViewController.swift
//  Write
//
//  Created by Zulwiyoza Putra on 10/14/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteContentTextView: UITextView!
    

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
        
        noteTitleTextField.text = ""
        
        noteContentTextView.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            if identifier == "Cancel" {
                print("Cancel button tapped")
            } else if identifier == "Save" {
                print("Save button tapped")
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text
                note.modificationTime = NSDate()
                
                let listNotesTableViewController = segue.destination as! ListNotesTableViewController
                listNotesTableViewController.notes.append(note)
            }
        }
    }


}

