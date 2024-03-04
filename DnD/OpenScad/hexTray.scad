//@Name: Dice Tray
//@Description: A simple tray with hexagonal dividers
//@Author: Yurre
//@Version: 1

/*[params]*/
$fn = 6;

hexTray(100, 200, 31);

module hexTray(trayX = 100, trayY = 200, trayZ = 31){
    difference(){
        cube([trayX, trayY, trayZ]);
        translate([0,0,0]){
            hexPattern(trayY, trayX, 30);
            translate([0,0,0]){
                
            }
        }
    }
}

module hexPattern(X, Y, hexD){
    translate([X/4,Y/4,16.5]){
        xAmount = floor(X / hexD);
        yAmount = floor(Y / hexD);
        echo("hexagonals on X = ", xAmount, "and on Y =", yAmount);
        for(i = [hexD : hexD : X]){ 
            translate([0,(i - hexD),0]){
                echo("y value: ", i);
                cylinder(h = 30, d = hexD, center = true);
            }
        }
    }
}