//
//  ViewController.swift
//  SFIMStats
//
//  Created by Enrique Ugalde on 25/08/16.
//  Copyright © 2016 Enrique Ugalde. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var lbl_inicio: NSTextField!
    @IBOutlet weak var lbl_paquetes: NSTextField!
    @IBOutlet weak var lbl_servicios: NSTextField!
    @IBOutlet weak var lbl_galeria: NSTextField!
    @IBOutlet weak var lbl_mapa: NSTextField!
    @IBOutlet weak var lbl_contacto: NSTextField!
    @IBOutlet weak var lbl_correos: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        lbl_inicio.stringValue = ""
        lbl_paquetes.stringValue = ""
        lbl_servicios.stringValue = ""
        lbl_galeria.stringValue = ""
        lbl_mapa.stringValue = ""
        lbl_contacto.stringValue = ""
        lbl_correos.stringValue = ""
        obtenerParams()
    }
    
    func obtenerParams() {
    }
    
    @IBAction func btn_actualizar(sender: AnyObject) {
    }
    
    @IBAction func btn_copiar(sender: AnyObject) {
    }

}

