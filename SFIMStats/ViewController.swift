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
    @IBOutlet weak var lbl_actualizado: NSTextField!
    
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
        NSTimer.scheduledTimerWithTimeInterval(60*10, target: self, selector: #selector(ViewController.obtenerParams) , userInfo: nil, repeats: true)
        let todaysDate:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy "
        let DateInFormat:String = dateFormatter.stringFromDate(todaysDate)
        lbl_actualizado.stringValue = String(DateInFormat)
    }
    
    @IBAction func btn_actualizar(sender: AnyObject) {
        obtenerParams()
    }
    
    @IBAction func btn_copiar(sender: AnyObject) {
        let stringToCopy = "Inicio: \(lbl_inicio.stringValue), Paquetes: \(lbl_paquetes.stringValue), Servicios \(lbl_servicios.stringValue), Galería: \(lbl_galeria.stringValue), Mapa: \(lbl_mapa.stringValue), Contacto: \(lbl_contacto.stringValue), Correos: \(lbl_correos.stringValue)."
        let pasteboard = NSPasteboard.generalPasteboard()
        pasteboard.clearContents()
        pasteboard.setString(stringToCopy, forType: NSPasteboardTypeString)
    }

}

