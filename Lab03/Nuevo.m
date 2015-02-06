//
//  Nuevo.m
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 04/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import "Nuevo.h"

UIAlertView *alert;

@interface Nuevo ()

@end

@implementation Nuevo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ocultaTeclado:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ocultaTeclado:(UITapGestureRecognizer *)sender{
    //Aquí hay que declarar todos los UITextField de nuestra escena
    [_txtNombre resignFirstResponder];
    [_txtEstado resignFirstResponder];
    [_txtYoutube resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnGuardar:(id)sender {
    NSString *nombre = self.txtNombre.text;
    NSString *estado = self.txtEstado.text;
    NSString *youtube = self.txtYoutube.text;
    NSData *imageData = UIImagePNGRepresentation([self.imgPhoto image]);
    if((nombre.length == 0)||(estado == 0)||(youtube == 0)){
        alert = [[UIAlertView alloc] initWithTitle:@"Datos Insuficientes"
                                           message:@"Deberás llenar todos los campos"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles: nil];
        [alert show];
    }
    else{
        if([[DBManager getSharedInstance]insertaDB:nombre estado:estado youtube:youtube foto:imageData]){
            [self performSegueWithIdentifier:@"NuevoToHome" sender:self];
        }
    }
}

- (IBAction)btnRegresar:(id)sender {
    [self performSegueWithIdentifier:@"NuevoToHome" sender:self];
}

- (IBAction)btnPhoto:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"Foto"
                                       message:@"Elige una opción"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Cámara", @"Carrete", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        NSLog(@"Cancelar");
    }
    else if(buttonIndex == 1)
    {
        NSLog(@"Cámara");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else if(buttonIndex == 2)
    {
        NSLog(@"Carrete");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:NULL];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imgPhoto.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
