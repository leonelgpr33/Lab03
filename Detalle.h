//
//  Detalle.h
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detalle : UIViewController

//Outlets
@property (strong, nonatomic) IBOutlet UITableView *tblDatos;

//Actiones
- (IBAction)btnRegresar:(id)sender;
- (IBAction)btnVermas:(id)sender;
- (IBAction)btnCompartir:(id)sender;

@end
