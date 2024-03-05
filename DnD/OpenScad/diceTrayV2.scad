include <BOSL2/std.scad>

hexTray();

module hexTray(L=4,W=2,Z=13, hexR=13, iWallT=1,oWallT=1){
    difference(){
        X=(((W*(3/4))+0.25)*((hexR+(iWallT/2))*2));
        Y=(L*(sqrt(3)*(hexR+(iWallT/2))));
        echo("",X);
        cuboid([X,Y,Z], p1 = [0,0,0]);
        translate([(hexR+(iWallT/2)),(sqrt(3)/2)*(hexR+iWallT/2),(Z/2)+(oWallT/2)]){
            hexGrid(L,W,hexR,Z,iWallT);
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