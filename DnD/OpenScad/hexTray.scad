//@Name: Dice Tray
//@Description: A simple tray with hexagonal dividers
//@Author: Yurre
//@Version: 1

/*[params]*/
$fn = 6;

hexTray(100, 180, 31);

module hexTray(trayX = 100, trayY = 180, trayZ = 31){
    difference(){
        cube([trayX, trayY, trayZ], center = true);
        translate([-(trayX / 4),-70,1]){
            hexPattern(trayY, trayX, 30, 15, 1);
        }
    }
}

module hexPattern(X, Y, Z, hexD, pattW, inverted = false){
    xAmount = floor(X / (2*hexD));
    yAmount = floor(Y / (2*hexD));
    oHexD = hexD + pattW;
    echo("hexagonals on X = ", xAmount, "and on Y =", yAmount);
    for(i = [0 : yAmount - 1]){
        if((i % 2) == 1){
            translate([i * ((3/2) * oHexD), (i % 2) * ((sqrt(3) * oHexD) / 2), 0]){
                if(inverted){
                    for(j = [0 : xAmount - 2]){
                        echo("loop: ", j);
                        translate([0,j *(sqrt(3) * oHexD), 0]){
                            difference(){
                                hexagon(oHexD, Z);
                                hexagon(hexD, Z + 1);
                            }
                        }
                    }
                } else {
                    for(j = [0 : xAmount - 2]){
                        echo("loop: ", j);
                        translate([0,j *(sqrt(3) * oHexD), 0]){
                            hexagon(hexD, Z);
                        }
                    }
                }
            }
        } else {
            translate([i * ((3/2) * oHexD), -(i % 2) * ((sqrt(3) * oHexD) / 2), 0]){
                if(inverted){
                    for(j = [0 : xAmount - 1]){
                        echo("loop: ", j);
                        translate([0,j *(sqrt(3) * oHexD), 0]){
                            difference(){
                                hexagon(oHexD, Z);
                                hexagon(hexD, Z + 1);
                            }
                        }
                    }
                } else {
                    for(j = [0 : xAmount - 1]){
                        echo("loop: ", j);
                        translate([0,j *(sqrt(3) * oHexD), 0]){
                            hexagon(hexD, Z);
                        }
                    }
                }
            }
        }
    }
}

module hexagon(diameter, height, center = true){
    cylinder(h = height, r = diameter, center = center, $fn = 6);
}