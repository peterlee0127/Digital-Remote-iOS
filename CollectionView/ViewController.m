
#import "ViewController.h"
#import "Cell.h"
#import "CameraViewController.h"
#import "SettingViewController.h"


NSString *kCellID = @"cellID";    // UICollectionViewCell storyboard id
 

@implementation ViewController
@synthesize button_name_array,main_title_array;

-(void)viewDidLoad
{
 
    
    button_name_array = [ [ NSArray alloc ] initWithObjects:@"控制",@"成員對話",@"公告",@"圖表",@"動態圖表",@"即時影像",@"設定",@"登出",nil];
    main_title_array=[[NSArray alloc] initWithObjects:@"remote.png",@"member.png",@"note.png",@"chart.png",@"dynamic",@"camera.png",@"setting.png",@"bye.png", nil];

    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"linen.jpg"]];
    [self.view addSubview:imgView];
    [self.view sendSubviewToBack:imgView];
    
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    
    // make the cell's title the actual NSIndexPath value
    cell.label.text = [NSString stringWithFormat:@"%@", [button_name_array objectAtIndex:(long)indexPath.row]];
    
    // load the image for this cell
    NSString *imageToLoad = [main_title_array objectAtIndex:indexPath.row];
    
    
    cell.image.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
             [self performSegueWithIdentifier:@"WebSocketController" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"MemberView" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"BoardView" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"GraphView" sender:self];
            break;
        case 4:
           [self performSegueWithIdentifier:@"DynamicViewController" sender:self];
            break;
        case 5:
            [self performSegueWithIdentifier:@"CameraViewController" sender:self];
            break;
        case 6:
            [self performSegueWithIdentifier:@"SettingViewController" sender:self];
            break;
        case 7:
            [self alert];
            [self.navigationController popViewControllerAnimated:YES];
            break;
        default:
            break;
    }
    
 

}
-(void)alert
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"您已登出" message:@""delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

// the user tapped a collection item, load and set the image on the detail view controller
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{


}

@end
