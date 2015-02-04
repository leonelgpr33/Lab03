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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
}

- (IBAction)btnRegresar:(id)sender {
    [self performSegueWithIdentifier:@"NuevoToHome" sender:self];
}

- (IBAction)btnPhoto:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"Fotografia"
                                       message:@"Que desea hacer?"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Camara", @"Carrete", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Alert buttons pressed");
    
    if(buttonIndex == 0)
         {
             NSLog(@"Cancelar");
             }
    else if(buttonIndex == 1)
         {
             NSLog(@"Camara");
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
