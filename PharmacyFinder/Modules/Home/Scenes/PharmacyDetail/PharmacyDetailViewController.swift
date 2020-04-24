//
//  PharmacyDetailViewController.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 24-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

enum TableViewRows: Int, CaseIterable {
    case localidad
    case telefono
    case comuna
    case fecha
    case codigoComuna
    case nombreLocal
    case diaFuncionamiento
    case idLocal
    case longitud
    case latitud
    case horaApertura
    case codigoLocalidad
    case codigoRegion
    case direccion
    case horaCierre
}

class PharmacyDetailViewController: UIViewController {
    var presenter: PharmacyDetailContract.Presenter?
    var pharmacy: Record?
    @IBOutlet weak var tableView: UITableView!
    
    
    convenience init() {
        self.init(nibName: "PharmacyDetailViewController", bundle: nil)
        setup()
    }
    
    func setup() {
        presenter = PharmacyDetailPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = pharmacy?.localNombre ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.register(PharmacyDetailCell.nib, forCellReuseIdentifier: PharmacyDetailCell.identifier)
    }
}

extension PharmacyDetailViewController: PharmacyDetailContract.View {
}

extension PharmacyDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewRows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PharmacyDetailCell.identifier, for: indexPath) as? PharmacyDetailCell {
            
            guard let pharmacy = pharmacy else {
                return UITableViewCell()
            }
            
            let currentRow: TableViewRows = TableViewRows.init(rawValue: indexPath.row)!
            switch currentRow {
            case .localidad:
                cell.labelTitle.text = "Localidad :"
                cell.labelDescription.text = pharmacy.localidadNombre
                
            case .telefono:
                cell.labelTitle.text = "Telefono :"
                cell.labelDescription.text = pharmacy.localTelefono
                
            case .comuna:
                cell.labelTitle.text = "Comuna :"
                cell.labelDescription.text = pharmacy.comunaNombre
                
            case .fecha:
                cell.labelTitle.text = "Fecha :"
                cell.labelDescription.text = pharmacy.fecha
                
            case .codigoComuna:
                cell.labelTitle.text = "Cód. Comuna :"
                cell.labelDescription.text = pharmacy.fkComuna
                
            case .nombreLocal:
                cell.labelTitle.text = "Nombre Local :"
                cell.labelDescription.text = pharmacy.localNombre
                
            case .diaFuncionamiento:
                cell.labelTitle.text = "Día Funcionamiento :"
                cell.labelDescription.text = pharmacy.funcionamientoDia
                
            case .idLocal:
                cell.labelTitle.text = "ID :"
                cell.labelDescription.text = String(pharmacy.id)
                
            case .longitud:
                cell.labelTitle.text = "Longitud :"
                cell.labelDescription.text = pharmacy.localLng
                
            case .latitud:
                cell.labelTitle.text = "Latitud :"
                cell.labelDescription.text = pharmacy.localLat
                
            case .horaApertura:
                cell.labelTitle.text = "Hora Apertura :"
                cell.labelDescription.text = pharmacy.funcionamientoHoraApertura
                
            case .codigoLocalidad:
                cell.labelTitle.text = "Cód. Localidad :"
                cell.labelDescription.text = pharmacy.fkLocalidad
                
            case .codigoRegion:
                cell.labelTitle.text = "Cód. Región :"
                cell.labelDescription.text = pharmacy.fkRegion
                
            case .direccion:
                cell.labelTitle.text = "Dirección :"
                cell.labelDescription.text = pharmacy.localDireccion
                
            case .horaCierre:
                cell.labelTitle.text = "Hora Cierre :"
                cell.labelDescription.text = pharmacy.funcionamientoHoraCierre
            }
            return cell
        }
        return UITableViewCell()
    }
    
}
