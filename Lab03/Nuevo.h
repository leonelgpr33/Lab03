//
//  Nuevo.h
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Nuevo : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate>

//outlets
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtEstado;
@property (strong, nonatomic) IBOutlet UITextField *txtYoutube;
@property (strong, nonatomic) IBOutlet UIImageView *imgPhoto;

//Actions
- (IBAction)btnGuardar:(id)sender;
- (IBAction)btnRegresar:(id)sender;
- (IBAction)btnPhoto:(id)sender;

@end
