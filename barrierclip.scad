include <BOSL2/std.scad>
include <BOSL2/hinges.scad>

$fn = 64;
// poteau 26.95 x 27.45., largeur face = 22.98
// trou de visse:  7.59 du top, 6.31 du bord avant, diam du trou 4 mm.
// rampe 27, 8mm poignee.

height = 16;

module face_plate( anchor=CENTER, spin=0, orient=UP ) {
    attachable(anchor, spin, orient, size=[5,30.45,height]) {
        diff() {
           cuboid([5, 30.45, height]) {

                tag("keep") position(LEFT) 
                    diff("nope", "yes") {  // holder
                        cuboid([26.95 +3 + 2.5, 30.45, height],rounding=1.5, edges=[TOP+LEFT, BOTTOM+LEFT],anchor=RIGHT) {
                            right(5) back(3.5) tag("nope")  cuboid([30.95 + 1.5, 30.45, height]);
                            tag("yes") align(LEFT+BACK)  xrot(-90) fwd(8) up(2.2) right(5) knuckle_hinge(length=height, segs=5, offset=2.2,  arm_height=0, arm_angle=90,spin=-90, inner = false); // cuboid([5, 5,10]);                            
                        }           
                    }
            } align(RIGHT+BACK) fwd(1.75) cuboid([1, 1.75, height]);
        }
        children();
    }
}
module clamp() {

        left(30.45 + 1.5) back(30.45 + 6.9) yrot(180) cuboid([3.5, 34.75, height], spin=-180) {
        attach(BACK) knuckle_hinge(length=height, segs=5, offset=3, arm_height=0, arm_angle=90,spin=-90, knuckle_diam=3.5, inner = true);
        attach(FRONT) right(1.75)cuboid([7,height,3.5]) align(RIGHT+BOTTOM) left(1.75) cuboid([1.75,height,  1.0]);
     }
}


module back_loop( anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor, spin, orient,r=22.4/2, h=height) {
        diff("back_loop_remove", "back_loop_keep") {  
            
            right_half() cyl(r=32.4/2, h=height, rounding=1.5) {
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
         back(3.5) cuboid([46.97, 3.5, height]) {
            align(RIGHT) {
                 left(32.4/2 -3) back(32.4/2 - 1.80) back_loop() align(BACK) {
                     xrot(90) yrot(180) fwd(height/2) up(3.05) right(2.5)
                         diff()  yrot(5) prismoid(size2=[5.29, height], h=3.5, xang=[95, 85], yang=[90, 90], anchor=RIGHT) {
                             edge_profile([TOP + BACK, TOP+FRONT], excess=1, convexity=20)
                                 mask2d_roundover(1.5);
                             tag("keep") align(RIGHT) {
                                 yrot(-5) cuboid([1, height, 3.5], rounding=1.5, edges=[TOP+FRONT, TOP+BACK]) align(RIGHT) xrot(90) left(3.5) fwd(1.75) cyl(r=3.5, h= height, rounding=1.5);
                             }
                         };
                 }   ; 
            }
            attach(LEFT) left(6.3) down(4.9) roundback();
        } 
     }

clamp();


module roundback() {
    test_radius = 11.3137085;
    tag_scope() {
            right_half(x=8) diff() {
                cyl(r=test_radius,h=85, rounding=1.5) {
                    tag("keep") align(CENTER, inside=true) {
                        cyl(r=test_radius - 3.5, h=85);
                    }
                }
                tag("remove") cyl(r=test_radius-1,h=70) ;
            }            
        }
    } children();




module foo() {
    cuboid([2,40,15]){
        position(TOP+RIGHT) orient(anchor=RIGHT)
            knuckle_hinge(length=40, segs=4, offset=3, arm_height=1,seg_ratio=1);

        attach(TOP,TOP) color("green")
            cuboid([2,40,15],anchor=TOP)
                position(TOP+LEFT) orient(anchor=LEFT)
                    color("Red")knuckle_hinge(length=40, segs=4, offset=3, arm_height=1,seg_ratio=1, inner=true);
    }
}

//foo();
//left(100) back_loop();