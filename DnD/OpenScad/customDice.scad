include <BOSL2/std.scad>

//@Author: Yurre
//@Version: 1
//@Date: 21/03/2024
//@Description: A custom dice

/*[Params]*/
//Size of the dice in mm (across all dimensions)
size = 20;

//Amount of rounding on the dice
rounding = 2;

//Height of the text in mm
tDepth = 1;

//Size of the text font
tSize = 14;

//Text on top of the dice
zPT = "C";

//Text on the bottom of the dice
zNT = "U";

//Text on the front of the dice
yPT = "S";

//Text on the back of the dice
yNT = "T";

//Text on the right of the dice
xPT = "O";

//Text on the left of the dice
xNT = "M";

//Determine whether or not to render the dice
renderDice = true;

//Determine whether or not to render the text seperately
renderText = false;

if(renderDice){
    cDice(size, rounding, tDepth, tSize, zPT, zNT, yPT, yNT, xPT, xNT);
}
if(renderText){
    translate([size, 0, 0]){
        text3d(zPT, tDepth, size=tSize, atype="ycenter", anchor=CENTER);
        translate([size, 0, 0]){
        text3d(zNT, tDepth, size=tSize, atype="ycenter", anchor=CENTER);
            translate([size, 0, 0]){
            text3d(yPT, tDepth, size=tSize, atype="ycenter", anchor=CENTER);
                translate([size, 0, 0]){
                text3d(yNT, tDepth, size=tSize, atype="ycenter", anchor=CENTER);
                    translate([size, 0, 0]){
                    text3d(xPT, tDepth, size=tSize, atype="ycenter", anchor=CENTER);
                        translate([size, 0, 0]){
                        text3d(xNT, tDepth, size=tSize, atype="ycenter", anchor=CENTER);
                        }
                    }
                }
            }
        }
    }
}

module cDice(size=20, rounding=2, tDepth=1, tSize=14, zPT="C", zNT="U", yPT="S", yNT="T", xPT="O", xNT="M"){
    difference(){
        cuboid(size, rounding=rounding);
        translate([0, 0, ((size/2) - (tDepth/2))]){
            text3d(zPT, tDepth, size=tSize, atype="ycenter", anchor=CENTER);
        }
        translate([0, 0, -((size/2) - (tDepth/2))]){
            text3d(zNT, tDepth, size=tSize, atype="ycenter", anchor=CENTER, spin=180);
        }
        translate([0, -((size/2) - (tDepth/2)), 0]){
            rotate([90,0,0]){
                text3d(yNT, tDepth, size=tSize, atype="ycenter", anchor=CENTER, spin=180);
            }
        }
        translate([0, ((size/2) - (tDepth/2)), 0]){
            rotate([90,0,0]){
                text3d(yPT, tDepth, size=tSize, atype="ycenter", anchor=CENTER);
            }
        }
        translate([((size/2) - (tDepth/2)), 0, 0]){
            rotate([90,0,90]){
                text3d(xPT, tDepth, size=tSize, atype="ycenter", anchor=CENTER, spin=0);
            }
        }
        translate([-((size/2) - (tDepth/2)), 0, 0]){
            rotate([90,0,90]){
                text3d(xNT, tDepth, size=tSize, atype="ycenter", anchor=CENTER, spin=180);
            }
        }
    }
}