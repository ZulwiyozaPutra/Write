//
//  ViewController.swift
//  Write
//
//  Created by Zulwiyoza Putra on 10/14/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

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
        let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        if segue.identifier == "Save" {
            // if note exists, update title and content
            if let note = note {
                // 1
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                print("'\(newNote.title)' saved")
                newNote.content = noteContentTextView.text ?? ""
                print("'\(newNote.content)' saved")
                newNote.modificationTime = NSDate()
                print("'\(newNote.title)' saved")
                RealmHelper.updateNote(noteToBeUpdated: note, newNote: newNote)
            } else {
                // if note does not exist, create new note
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                print("'\(note.title)' saved")
                note.content = noteContentTextView.text ?? ""
                print("'\(note.content)' saved")
                note.modificationTime = NSDate()
                // 2
                RealmHelper.addNote(note: note)
            }
            listNotesTableViewController.notes = RealmHelper.retrieveNotes()
        } else if segue.identifier == "Cancel" {
            print("Cancel button tapped")
        }
    }
}

