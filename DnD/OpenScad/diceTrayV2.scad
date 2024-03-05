include <BOSL2/std.scad>

hexTray();

module hexTray(X=51, Y=95, Z=14, hexR=13, iWallT=1,oWallT=1){
    xAmount = floor(X / ((sqrt(3)/2)*(hexR+(iWallT/2))));
    yAmount = floor(X / (hexR+(iWallT/2))) - 1;
    echo("", yAmount);
    difference(){
        hexRfr = 13 + (iWallT/2);
        cuboid([X,Y,Z], p1 = [0,0,0]);
        translate([hexRfr + oWallT,(sqrt(3)/2)*hexRfr+ oWallT,(Z/2)+(oWallT /2)]){
            hexGrid(xAmount,yAmount,hexR,13,1); 
        }
    }
}

module hexGrid(length, width, hexR, hexH, spacing, inverted = false){
    oHex = hexR + (spacing / 2);
    for(i = [0 : width-1]){
        if(i%2 == 1){
            translate([i * ((3/2) * oHex), (i % 2) * ((sqrt(3) * oHex) / 2), 0]){
                for(j = [0: length-2]){
                    translate([0,j*(sqrt(3) * oHex), 0]){
                        difference(){
                            if(inverted){
                                hexagon(hexH, oHex);
                            }
                            hexagon(hexH, hexR);
                        }
                    }
                }
            }
        } else {
            translate([i * ((3/2) * oHex), -(i % 2) * ((sqrt(3) * oHex) / 2), 0]){
                for(j = [0: length-1]){
                    translate([0,j*(sqrt(3) * oHex), 0]){
                        difference(){
                            if(inverted){
                                hexagon(hexH, oHex);
                            }
                            hexagon(hexH, hexR);
                        }
                    }
                }
            }
        }
    }
}

module hexagon(height, radius, center = true){
    cylinder(h = height, r = radius, center = center, $fn = 6);
}