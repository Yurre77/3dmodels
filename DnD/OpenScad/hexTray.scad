//@Name: Dice Tray
//@Description: A simple tray with hexagonal dividers
//@Author: Yurre
//@Version: 1

/*[params]*/


hexTray(100, 200, 31);

module hexTray(trayX = 100, trayY = 200, trayZ = 31){
    difference(){
        cube([trayX, trayY, trayZ], center = true);
        translate([0,0,0.6]){
            cylinder(h = 30, d = 30, center = true);
            translate([0,0,0]){
                
            }
        }
    }
}