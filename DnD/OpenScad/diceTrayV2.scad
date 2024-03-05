include <BOSL2/std.scad>

difference(){
    cuboid([52, 100, 15], p1=[-15,-14,-2], rounding=4, edges=[BOTTOM+LEFT+RIGHT+BACK+FRONT, FRONT+RIGHT, BACK+LEFT, FRONT+LEFT, BACK+RIGHT]);
    translate([0,0,8]){
        hexGrid(4, 2, 13, 13, 2);
    }
    translate([33, -10, 11]){
        //cylinder(h = 2.01, d = 5, $fn=360);
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