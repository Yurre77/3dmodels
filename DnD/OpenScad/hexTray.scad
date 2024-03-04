//@Name: Dice Tray
//@Description: A simple tray with hexagonal dividers
//@Author: Yurre
//@Version: 1

/*[params]*/

hexTray(100, 180, 26);

module hexTray(trayX = 100, trayY = 180, trayZ = 31){
    union(){
        difference(){
            cube([trayX - 15, trayY - 10, trayZ], center = true);
            translate([-(trayX / 4),-(trayY / (180 / 70)),1]){
            hexPattern(trayY, trayX, trayZ - 1, 15, 1);
            }
        translate([0, trayX /1.3,-trayZ / 2]){
            sphere(d = 10.2);
        }
        translate([0, -trayX /1.3,-trayZ / 2]){
            sphere(d = 10.2);
        }
        }
        translate([0, trayX /1.3,trayZ / 2]){
            sphere(d = 10);
        }
        translate([0, -trayX /1.3,trayZ / 2]){
            sphere(d = 10);
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