//
//  AgendaList.h
//  Lab03
//
//  Created by LI Leonel G. Pérez Ramos on 05/02/15.
//  Copyright (c) 2015 Leonel_GPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgendaList : UITableViewCell

//outlets
@property (strong, nonatomic) IBOutlet UIImageView *imgFoto;
@property (strong, nonatomic) IBOutlet UILabel *lblNombre;
@property (strong, nonatomic) IBOutlet UILabel *lblEstado;

@end
