include <BOSL2/std.scad>

/*[params]*/
//length of the tray and lid in hexagons
L=4;
//width of the tray and lid in hexagons
W=2;
//Height of each hexagon in mm
Z=13;
//the radius of the internal hexagons in mm
hexR=13;
//spacing between the internal hexagons in mm
iWallT=1;
//the size of the case walls in mm
oWallT=2;
//diameter of magnets in mm
magnetD=5.1;
//height of the magnets in mm
magnetH=2;
//length of the pattern in hexagons
patternL=5;
//width of the pattern in hexagons
patternW=3;
//radius of the pattern hexagons in mm
patternR=13;
//spacing of the pattern hexagons in mm
patternS=1;
//text on the lid
text="Dice";
//size of the text
tSize=12;
//determine whether or not to render the entire case
renderCase=true;
//determine whether or not to render the tray seperately
renderTray=true;
//determine whether or not to render the lid seperately
renderLid=true;
//determine whether or not to render the text for the lid seperately or not
renderText=true;

if(renderCase){
    hexTray(L,W,Z,hexR,iWallT,oWallT,magnetD,magnetH);
    translate([0,(L*(sqrt(3)*(hexR+(iWallT/2))))+oWallT,Z*2]){
        rotate([180,0,0]){
            hexLid(L,W,Z,hexR,iWallT,oWallT,magnetD,magnetH, patternL,patternW,patternR,patternS,text,tSize);
        }
    }
}

if(renderTray){
    translate([((W*L)/2)*Z,0,0]){
        hexTray(L,W,Z,hexR,iWallT,oWallT,magnetD,magnetH);
    }
}

if(renderLid){
    translate([-(((W*L)/2)*Z),0,0]){
        hexLid(L,W,Z,hexR,iWallT,oWallT,magnetD,magnetH, patternL,patternW,patternR,patternS,text,tSize);
    }
}

if(renderText){
    translate([-(((W*L)/2)*Z)-tSize,tSize*2,0]){
        text3d(text,h=oWallT/2,anchor=CENTER,font="Cubic",spin=90,direction="ltr",size=tSize);
    }
}

module hexTray(L=4,W=2,Z=13,hexR=13,iWallT=1,oWallT=2, magnetD=5, magnetH=2){
    X=(((W*(3/4))+0.25)*((hexR+(iWallT/2))*2));
    Y=(L*(sqrt(3)*(hexR+(iWallT/2))));
    echo("",Y);
    difference(){
         cuboid([X+oWallT,Y+oWallT,Z+(oWallT/2)], p1 = [0,0,0], rounding=3, edges=[BOTTOM,FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
         translate([(hexR+(iWallT/2))+(oWallT/2),(sqrt(3)/2)*(hexR+iWallT/2)+(oWallT/2),(Z/2)+(oWallT/2)]){
            hexGrid(L,W,hexR,Z,iWallT);
        }
        translate([(magnetD/2)+(oWallT/2),((L-1)*(sqrt(3)*(hexR+(iWallT/2))))+(oWallT/2), Z]){
            cylinder(h=magnetH,d=magnetD,center=true,$fn=36);
        }
        translate([(magnetD/2)+(oWallT/2),(sqrt(3)*(hexR+(iWallT/2)))+(oWallT/2), Z]){
            cylinder(h=magnetH,d=magnetD,center=true,$fn=36);
        }
        translate([(X-(magnetD/2)),(magnetD/2)+(oWallT/2),Z]){
            cylinder(h=magnetH,d=magnetD,center=true,$fn=36);
        }
        translate([(X-(magnetD/2)),(L*(sqrt(3)*(hexR+(iWallT/2))))-((magnetD/2)-(oWallT/2)),Z]){
            cylinder(h=magnetH,d=magnetD,center=true,$fn=36);
        }
    }
}

module hexLid(L=4,W=2,Z=13, hexR=13, iWallT=1,oWallT=2, magnetD=5, magnetH=2, patternL=5, patternW=3, patternR=13, patternS=1,text="Dice",tSize=12){
    X=(((W*(3/4))+0.25)*((hexR+(iWallT/2))*2));
    Y=(L*(sqrt(3)*(hexR+(iWallT/2))));
    echo("",Y);
    difference(){
         cuboid([X+oWallT,Y+oWallT,Z+(oWallT/2)], p1 = [0,0,0], rounding=3, edges=[BOTTOM,FRONT+LEFT,FRONT+RIGHT,BACK+LEFT,BACK+RIGHT]);
         translate([(hexR+(iWallT/2))+(oWallT/2),(sqrt(3)/2)*(hexR+iWallT/2)+(oWallT/2),(Z/2)+(oWallT/2)]){
            hexGrid(L,W,hexR,Z,iWallT);
        }
        translate([(magnetD/2)+(oWallT/2),((L-1)*(sqrt(3)*(hexR+(iWallT/2))))+(oWallT/2), Z]){
            cylinder(h=magnetH,d=magnetD,center=true,$fn=36);
        }
        translate([(magnetD/2)+(oWallT/2),(sqrt(3)*(hexR+(iWallT/2)))+(oWallT/2), Z]){
            cylinder(h=magnetH,d=magnetD,center=true,$fn=36);
        }
        translate([(X-(magnetD/2)),(magnetD/2)+(oWallT/2),Z]){
            cylinder(h=magnetH,d=magnetD,center=true,$fn=36);
        }
        translate([(X-(magnetD/2)),(L*(sqrt(3)*(hexR+(iWallT/2))))-((magnetD/2)-(oWallT/2)),Z]){
            cylinder(h=magnetH,d=magnetD,center=true,$fn=36);
        }
        translate([(hexR+(iWallT/2))/3,oWallT/2,0]){
            hexGrid(patternL,patternW,patternR,(oWallT/2),patternS,true);
        }
        translate([(X/2+((tSize/2))),Y/2,0]){
            rotate([180,0,0]){
                text3d(text,h=oWallT/2,anchor=CENTER,font="Cubic",spin=90,direction="ltr",size=tSize);
            }
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