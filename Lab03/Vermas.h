//
//  Vermas.h
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface Vermas : UIViewController

//Outlets
@property (strong, nonatomic) IBOutlet UILabel *lblNombre;
@property (strong, nonatomic) IBOutlet UILabel *lblEstado;
@property (strong, nonatomic) IBOutlet UIImageView *imgPhoto;
@property (strong, nonatomic) IBOutlet UIWebView *webVideo;

//Actions
- (IBAction)btnRegresar:(id)sender;

@end
