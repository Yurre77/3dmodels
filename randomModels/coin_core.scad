include <BOSL2/std.scad>

union(){
difference(){
    cyl(38, d=30, $fn=180, anchor = BOTTOM);
    cyl(2.5, d= 25, $fn=60, anchor=BOTTOM);
    translate([14,0,0]){
        cuboid([2.5, 2.5, 38], anchor=BOTTOM);
    }
    translate([0,0,3]){
        difference(){
            cyl(2.5, d=30, $fn=180, anchor=BOTTOM);
            cyl(2.5,d=27, $fn=60, anchor=BOTTOM);
        }
    }
    translate([0,0,13]){
        difference(){
            cyl(2.5, d=30, $fn=180, anchor=BOTTOM);
            cyl(2.5,d=27, $fn=60, anchor=BOTTOM);
        }
    }
    translate([0,0,23]){
        difference(){
            cyl(2.5, d=30, $fn=180, anchor=BOTTOM);
            cyl(2.5,d=27, $fn=60, anchor=BOTTOM);
        }
    }
    translate([0,0,33]){
        difference(){
            cyl(2.5, d=30, $fn=180, anchor=BOTTOM);
            cyl(2.5,d=27, $fn=60, anchor=BOTTOM);
        }
    }
}
translate([0,0,38]){
    cyl(5, d= 38, $fn=6, anchor=BOTTOM, spin=90);
}
}