include <BOSL2/std.scad>
$fn = 64;
// poteau 26.95., largeur face = 22.98
// trou de visse:  7.59 du top, 6.31 du bord avant, diam du trou 4 mm.

module face_plate( anchor=CENTER, spin=0, orient=UP ) {
    attachable(anchor, spin, orient, size=[5,30.45,37.62]) {
        diff() {
            cuboid([5, 30.45, 37.62], rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT]) {

                tag("keep") position(LEFT) 
                    diff("nope", "yes") {  // holder
                        cuboid([29.95, 30.45, 37.62],rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT],anchor=RIGHT) {
                            right(3.5) back(3.5) tag("nope") cuboid([30.95, 30.45, 37.62]);
                            
                            tag("yes")align(BACK+LEFT) {
                                right(3.5) cuboid([3.5, 0.5, 37.62], anchor=RIGHT);
                            }
                        }
                    
                    }
                tag("keep") align(BACK) {
                    left(0.25)  cuboid([5.5, 0.5, 37.62], anchor=FRONT);
                }
            }
        }
        children();
    }
}

module back_loop( anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor, spin, orient,r=22.4/2, h=37.62) {
        diff("back_loop_remove", "back_loop_keep") {  
            
            right_half() cyl(r=22.4/2, h=37.62, rounding=3) {
                tag("back_loop_remove") align(CENTER, inside=true) {
                    cyl(r=22.4/2 - 3.5, h=37.62);
                }
            }
        };
        children();
    }
}

face_plate()  
    align(FRONT+RIGHT) {
        back(3.5) cuboid([35.97, 3.5, 37.62], rounding=3, edges=[TOP+FRONT, BOTTOM+FRONT]) align(RIGHT) {
  //                              xrot(90) yrot(90) left(1.75) up(1.75) prismoid(size2=[22.4, 37.62], h=3.5 ,  xang=[90, 95], yang=[90, 90], rounding=[3,3,3,3])  align(RIGHT) {

                left(22.4/2) back(22.4/2 - 1.75) back_loop() align(BACK) {
                    xrot(90) yrot(180) fwd(37.62/2) down(2.2) right(5)
                        diff()  yrot(5) prismoid(size2=[10.29, 37.62], h=3.5, xang=[95, 85], yang=[90, 90], anchor=RIGHT) {
                            edge_profile([TOP + BACK, TOP+FRONT], excess=1, convexity=20)
                                mask2d_roundover(3);
                            tag("keep") align(RIGHT) {
                                yrot(-5) cuboid([4, 37.62, 3.5], rounding=3, edges=[TOP+FRONT, TOP+BACK]) align(RIGHT) xrot(90) left(3.5) fwd(1.75)cyl(r=3.5, h= 37.62, rounding=3);
                            }
                        };
                }   ; 
            }
    }

//left(100) back_loop();