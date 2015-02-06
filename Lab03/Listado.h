//
//  Listado.h
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Listado : UIViewController

//Outlets

@property (strong, nonatomic) IBOutlet UITableView *tblDatos;
@property (strong, nonatomic) IBOutlet UIButton *eliminar;
@property (strong, nonatomic) IBOutlet UIButton *editar;

//Actions
- (IBAction)btnRegresar:(id)sender;
- (IBAction)btnEditar:(id)sender;
- (IBAction)btnEliminar:(id)sender;

@end
