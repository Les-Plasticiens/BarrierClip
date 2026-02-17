include <BOSL2/std.scad>
$fn = 64;
// poteau 26.95 x 27.45., largeur face = 22.98
// trou de visse:  7.59 du top, 6.31 du bord avant, diam du trou 4 mm.
// rampe 27, 8mm poignee.

height = 16;

module face_plate( anchor=CENTER, spin=0, orient=UP ) {
    attachable(anchor, spin, orient, size=[5,30.45,height]) {
        diff() {
           cuboid([5, 30.45, height], rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT]) {

                tag("keep") position(LEFT) 
                    diff("nope", "yes") {  // holder
                        cuboid([26.95 +3 + 2.5, 30.45, height],rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT, TOP+LEFT, BOTTOM+LEFT],anchor=RIGHT) {
                            right(5) back(3.5) tag("nope") cuboid([30.95 + 1.5, 30.45, height]);
                            
                            tag("yes")align(BACK+LEFT) {
                               right(6) cuboid([6, 0.5, height], rounding=3, edges=[ TOP+LEFT, BOTTOM+LEFT], anchor=RIGHT);
                            }
                        }
                    
                    }
                tag("keep") align(BACK) {
                    left(0.25)  cuboid([5.5, 0.5, height], anchor=FRONT);
                }
            }
        }
        children();
    }
}

module back_loop( anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor, spin, orient,r=22.4/2, h=height) {
        diff("back_loop_remove", "back_loop_keep") {  
            
            right_half() cyl(r=32.4/2, h=height, rounding=3) {
                tag("back_loop_remove") align(CENTER, inside=true) {
                    cyl(r=32.4/2 - 3.5, h=height);
                }
            }
        };
        children();
    }
}

face_plate()  
    align(FRONT+RIGHT) {
        back(3.5) cuboid([46.97, 3.5, height], rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT]) align(RIGHT) {

                left(32.4/2 -3) back(32.4/2 - 1.80) back_loop() align(BACK) {
                    xrot(90) yrot(180) fwd(height/2) up(3.05) right(2.5)
                        diff()  yrot(5) prismoid(size2=[5.29, height], h=3.5, xang=[95, 85], yang=[90, 90], anchor=RIGHT) {
                            edge_profile([TOP + BACK, TOP+FRONT], excess=1, convexity=20)
                                mask2d_roundover(3);
                            tag("keep") align(RIGHT) {
                                yrot(-5) cuboid([1, height, 3.5], rounding=3, edges=[TOP+FRONT, TOP+BACK]) align(RIGHT) xrot(90) left(3.5) fwd(1.75) cyl(r=3.5, h= height, rounding=3);
                            }
                        };
                }   ; 
            }
    }

//left(100) back_loop();